class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  protect_from_forgery with: :exception
  # For APIs, you may want to use :null_session instead.
  # Give access to helper methods in the view
  include SessionsHelper
end
