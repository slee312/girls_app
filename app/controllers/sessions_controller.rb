class SessionsController < ApplicationController
  include SessionsHelper

  def create
    unless signed_in?
      auth = request.env['omniauth.auth']
      @auth = Authorization.update_or_create_from_hash(auth)

      self.current_user = @auth.user
      flash['success'] = "Welcome, " + auth['info']['first_name'] + "!"

      self.current_user.store_facebook_info
      info = current_user.user_info
      flash['warning'] = "#{info.first_name} #{info.last_name} #{info.gender} #{info.email} #{info.identifier}"
    end

    redirect_back_or home_url
  end

  def destroy
    if signed_in?
      @current_user = nil
      reset_session
      flash['success'] = "You have been logged out."
    end
    redirect_to root_url
  end

end
