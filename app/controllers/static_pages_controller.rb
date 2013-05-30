class StaticPagesController < ApplicationController
  def home
    if signed_in?
      redirect_to home_url
    end
    @app_name = "Girls App"
  end
  def help

  end
  def privacy

  end
  def terms

  end
  def about

  end

end
