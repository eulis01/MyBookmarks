class SessionsController < ApplicationController
  def home 

  end

  def new

  end

  def create
    user = User.find_by(username: params[:username]) 
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:error] = "Invalid username or password"
      redirect_to "/login"
  end
  
  def github
    @user = User.find_or_create_from_auth_hash(auth_hash)
    self.current_user = @user
    redirect_to root_path
  end

  def failure
    flash[:error] = "Invalid username or password"
    redirect_to "/login"
  end

  def destroy
        session[:user_id] = nil
    redirect_to root_path
  end
  end

end