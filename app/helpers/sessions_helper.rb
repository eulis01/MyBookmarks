module SessionHelper 

  # Logs In  The given user.
  def log_in(user)
    session[:user_id] = user.id
  end

  # Remenber a user in a persistent session.
  def remember(user)
    user.remenber
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  # Returns the user corresponding to the remember token cookie.
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
          log_in user
          @current_user = user
      end
    end
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

  # Log Out the current user.
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  # Redirect to Root if not logged in.
  def redirect_if_not_logged_in
    redirect_to root_path if !logged_in?
  end
end