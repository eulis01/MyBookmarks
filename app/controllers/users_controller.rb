class UsersController < ApplicationController
  before_action :redirect_if_not_logged_in, except: [:new, :create]
  def new
    @user = User.new
  end

  def create
    #binding.pry
    @user = User.new(user_params)
    set_non_auth_uid
    if @user.save && @user.uid.present?
      log_in(@user)
      #session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    # this is the user's profile page - security measure to prevent users from seeing other users' profiles.
      redirect_to root_path && session.clear unless current_user.id == params[:id].to_i 
      @user = User.find_by_id(params[:id])
      @bookmarks = @user.bookmarks.order(created_at: :desc)
    

  end

  private 

    def user_params
      # Allow certain parameters to be passed in at signup.
      params.require(:user).permit(:username, :email, :password, :password_confirmation, :uid, tags_attributes: [:*])
      #params.permit(:username, :email, :uid, :password, :password_confirmation)
    end

    def set_non_auth_uid
      @user.uid = SecureRandom.hex(10)
    end
end
