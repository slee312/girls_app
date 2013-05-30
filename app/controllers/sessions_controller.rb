class SessionsController < ApplicationController
  include SessionsHelper

  def create
    unless signed_in?
      auth = request.env['omniauth.auth']
      @auth = Authorization.update_or_create_from_hash(auth)

      self.current_user = @auth.user
      flash['success'] = "Welcome, " + auth['info']['first_name'] + "!"
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
