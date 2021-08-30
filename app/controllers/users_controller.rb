class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    set_non_auth_uid
    if @user.save && @user.uid.present?
      session[:user_id] = @user.id
      flash[:success] = "Thanks for signing up!"
      redirect_to @user
    else
      render :new
    end
  end

  def show
    redirect_if_not_logged_in
    @user = User.includes(bookmarks: :tags).find_by_id(params[:id])
    redirect_to root_path if @user.nil?
  end

  private 

  def user_params
        params.require(:user).permit(:username, :email, :uid, :password, :password_confirmation)
  end

end
