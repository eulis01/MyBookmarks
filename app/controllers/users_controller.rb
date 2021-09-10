class UsersController < ApplicationController

  def new
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
    if !logged_in?
      redirect_to '/'
    elsif
      @user = User.find_by(id: params[:id])
      @bookmarks = @user.bookmarks
      @user = User.includes(bookmarks: :tags).find_by_id(params[:id])
    else
      @user = nil
      redirect_to '/'
    end
  end

  private 

  def user_params
        params.require(:user).permit(:username, :email, :uid, :password, :password_confirmation)
  end

  def set_non_auth_uid
    @user.uid = SecureRandom.hex(10)
  end
end
