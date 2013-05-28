class SessionsController < ApplicationController
  def create
    auth = request.env['omniauth.auth']
    @auth = Authorization.update_or_create_from_hash(auth)

    self.current_user = @auth.user
    flash['success'] = "Welcome, " + auth['info']['first_name'] + "!"
    redirect_to root_url
  end

  def destroy
    @current_user = nil
    reset_session
    flash['success'] = "You have been logged out."
    redirect_to root_url
  end
end
