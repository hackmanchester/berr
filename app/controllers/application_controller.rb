class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def logged_in
  	if current_user == nil
  		flash.now.alert = "You need to log in."
  		redirect_to login_url
  	end
  end
  helper_method :admin?
end
