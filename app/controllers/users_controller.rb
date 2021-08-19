class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Thanks for signing up!"
      redirect_to @user
    else
      render 'new'
    end
  end

end
