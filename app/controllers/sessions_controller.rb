class SessionsController < ApplicationController
  def home 
  end

  def new
    if session[:user_id]
      redirect_to user_path(current_user)
    end
  end

  def create
    if auth
      @user = User.find_or_create_by(email:auth[:info][:email]) do |user|
        user.username = auth[:info][:nickname]
        user.email = auth[:info][:email]
        user.uid = auth[:uid]
        user.password = SecureRandom.hex(16)
      end
      if @user.save
        session[:user_id] = @user.id
        flash[:success] = "Welcome,#{@user.username}"
        redirect_to user_path(@user)
      else
        flash[:error] = "!!!There was an error creating a User!!!"
        redirect_if_not_logged_in
      end
    else
      @user = User.find_by(email: params[:email])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        flash[:success] = "Welcome,#{@user.username}"
        redirect_to user_path(@user)
      else
        flash[:error] = "Invalid username or password"
        redirect_to login_path
      end
    end
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

  # def create
  #   user = User.find_by(username: params[:username]) 
  #   if user && user.authenticate(params[:user][:password])
  #     session[:user_id] = user.id
  #     redirect_to user_path(user)
  #   else
  #     flash[:error] = "Invalid username or password"
  #     redirect_to login_path
  #   end
  # end
  
  # def github
    
  #   @user = User.find_or_create_by(email:auth[:info][:email]) do |user|
  #     user.email = auth[:info][:email]
  #     user.username = auth[:info][:username]
  #     user.uid = auth[:info][:uid]
  #     user.password = SecureRandom.hex(32)
  #   end
  #   if @user.save
  #     session[:user_id] = user.id
  #     flash[:success] = "Welcome to the site, #{user.username}"
  #   redirect_to user_path(@user)
  #   else
  #     redirect_if_not_logged_in
  #   end
  # end

  # def failure
  #   flash[:error] = "Invalid username or password"
  #   redirect_to login_path
  # end