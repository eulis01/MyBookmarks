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
  end
  
  def github
    @user = User.find_or_create_by(email:auth_hash[:info][:email]) do |user|
      user.username = auth_hash[:info][:username]
      user.password = SecureRandom.hex(32)
    end
    if @user.save
      session[:user_id] = user.id
    redirect_to user_path(@user)
    else
      redirect_if_not_logged_in
    end
  end

  def failure
    flash[:error] = "Invalid username or password"
    redirect_to "/login"
  end

  def destroy
        session[:user_id] = nil
    redirect_to root_path
  end

  private
  def auth
    request.env['omniauth.auth']
  end
end