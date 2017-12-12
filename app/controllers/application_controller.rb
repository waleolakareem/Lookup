class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    if current_user
      return true
    else
      return false
    end
  end

  helper_method :current_user, :logged_in? ,  :create_with_omniauth

end
