class UsersController < ApplicationController
  before_filter :signed_in_user
  include SessionsHelper

  def home
  end
  def explore
    @scrambled = gen_connections(current_user, 2, 1)
  end
  def recommend
  end



  private
  def signed_in_user
    unless signed_in?
      store_location
      redirect_to "/auth/facebook"
    end   
  end
  
  def gen_connections(user, degree, curr_degree)
   current_connections = Array.new(2) { Array.new }
   if degree >= 1
      user.friends.each do |friend|  
        if !current_connections[0].include?(friend) and current_user.uid != friend.uid
          if friend_conv = User.find_by_uid(friend.uid)
            new_connections = gen_connections(friend_conv, degree - 1, curr_degree + 1)
            counter = 0;
            new_connections[0].each do |new_connection|
              if !current_connections[0].include?(new_connection) and current_user.gender != new_connection.gender
                current_connections[0] << new_connection
                current_connections[1] << new_connections[1][counter]
              end
              counter += 1
            end
          end
          if current_user.gender != friend.gender
            if !current_connections[0].include?(friend)
              current_connections[0] << friend
              current_connections[1] << curr_degree
            end
          end
        end
      end
   end

   current_connections
  end


end
