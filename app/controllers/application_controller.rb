class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  protect_from_forgery with: :exception
  # For APIs, you may want to use :null_session instead.
  # Give access to helper methods in the view
  helper_method :current_user, :logged_in?

  private

  def redirect_if_not_logged_in
    redirect_to login_path if !logged_in?
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!session[:user_id]
  end
end
