module SessionsHelper 

  # Logs In  The given user.
  def log_in(user)
    session[:user_id] = user.id
  end

  # Returns the current logged-in user (if any).
  def current_user
    @user ||= User.find_by(id: session[:user_id])
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

  # Log Out the current user.
  def log_out
    session.delete(:user_id)
    current_user = nil
  end

  # Redirect to Root if not logged in.
  def redirect_if_not_logged_in
    redirect_to root_path if !logged_in?
  end
end