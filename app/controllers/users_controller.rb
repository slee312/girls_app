class UsersController < ApplicationController
  before_filter :signed_in_user
  include SessionsHelper

  def home
  end
  def explore
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
end
