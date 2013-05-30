module SessionsHelper
  def redirect_back_or(default)
    redirect_to session[:last_location] || default
    session.delete :last_location  
  end

  def store_location
    session[:last_location] = request.url
  end
end
