class SessionsController < ApplicationController
  def home; end
  def new; end

  def create
    if params[:provider] == "github"
      user = User.find_or_create_from_github_omniauth(auth)
      if user.persisted?
        log_in(user)
        redirect_to user_path(user)
      else
        flash[:message] = "There was an error while trying to authenticate you..."
        redirect_to root_path
      end
    else
      @user = User.find_by(email: params[:email])
      if @user && @user.authenticate(params[:password])
        log_in(@user)
        redirect_to user_path(@user)
      else
        flash[:message] = "Invalid Login Information. Please try again."
        redirect_to login_path
      end
    end
  end

  def destroy
    log_out if logged_in?
    flash[:message] = "You have successfully logged out."
    redirect_to root_path
  end
  
  private
  
    def auth
      request.env['omniauth.auth']
    end
end