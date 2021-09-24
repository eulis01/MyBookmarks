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
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    # this is the user's profile page - security measure to prevent users from seeing other users' profiles.
    redirect_to root_path && session.clear unless current_user.id == params[:id].to_i
    @user = User.find_by_id(params[:id])
    #@bookmarks = @user.bookmarks
    #@user = User.includes(bookmarks: :tags).find_by_id(params[:id])
  end

  private 

  def user_params
    # this params hash by itself is not secure enough according to the rails docs. - because it allows for mass assignment.
    #params.require(:user).permit(:username, :email, :uid, :password, :password_confirmation) -- this wasn't working because my params hash was not being nested in the user hash.

    # this way is not secure as it allows for mass assignment.
        params.permit(:username, :email, :uid, :password, :password_confirmation)

    # this is the most secure way to do it, according to the rails docs.
      # params.require(:user).permit(:username, :email, :uid, :password, :password_confirmation).tap do |user_params|
      #  user_params.require(:username, :email, :uid, :password, :password_confirmation)
      # end


  end

  def set_non_auth_uid
    @user.uid = SecureRandom.hex(10)
  end
end
