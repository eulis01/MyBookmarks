class UsersController < ApplicationController
  before_action :redirect_if_not_logged_in, except: [:new, :create]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    set_non_auth_uid
    if @user.save && @user.uid.present?
      session[:user_id] = @user.id
      flash[:success] = "Thanks for signing up!"
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    # this is the user's profile page - securityy measure to prevent users from seeing other users' profiles.
    redirect_to root_path && session.clear unless current_user.id == params[:id].to_i
    @user = User.find_by_id(params[:id])
    #@bookmarks = @user.bookmarks
    #@user = User.includes(bookmarks: :tags).find_by_id(params[:id])
  end

  private 

  def user_params
        params.require(:user).permit(:username, :email, :uid, :password, :password_confirmation)
  end

  def set_non_auth_uid
    @user.uid = SecureRandom.hex(10)
  end
end
