class SessionsController < ApplicationController
  def home 
  end

  def new
  end

  def create
    if params[:provider] == 'github'
      @user = User.create_by_github_omniauth(auth)
      session[:user_id] = @user.id
      flash[:success] = "Welcome,#{@user.username}"
      redirect_to user_path(@user)
    else
      @user = User.find_by(email: params[:email])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        flash[:success] = "Welcome,#{@user.username}"
        redirect_to user_path(@user)
      else
        flash[:error] = "Invalid Login Informatio. Please try again."
        redirect_to login_path
      end
    end
  end

  def destroy
    session.delete(:user_id)
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