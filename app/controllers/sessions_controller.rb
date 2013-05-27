class SessionsController < ApplicationController
  def create
    auth = request.env['omniauth.auth']
    unless @auth = Authorization.find_from_hash(auth)
      @auth = Authorization.create_from_hash(auth, current_user)
    end

    self.current_user = @auth.user
    flash['success'] = "Welcome, " + auth['info']['name'] + "!"
    redirect_to root_url
  end

  def destroy
    @current_user = nil
    reset_session
    flash['success'] = "You have been logged out."
    redirect_to root_url
  end
end
