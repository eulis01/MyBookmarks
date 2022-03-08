class BookmarksController < ApplicationController
  before_action :redirect_if_not_logged_in 
  before_action :set_bookmark, except: [:index, :new, :create]
  before_action :set_bookmark_owner, only: [:edit, :update, :destroy]

  def index
    if params[:user_id] && current_user.id == params[:user_id].to_i
      @bookmarks = current_user.bookmarks.alpha
    else
      flash[:message] = "This user doesn't exist" if params[:user_id]
      @bookmarks = Bookmark.alpha.includes(:user)
    end
  end

  def show
    redirect_to bookmarks_path if !@bookmark
  end

  def new
        @bookmark = current_user.bookmarks.build
        @bookmark.tags.build
        @bookmark.build_user if !@bookmark.user
  end

  def create
    @bookmark = current_user.bookmarks.build(bookmark_params)
    if @bookmark.save
      redirect_to bookmarks_path
    else
      render :new
    end
  end
  
  def edit
    @bookmark.build_user if !@bookmark.user
  end

  def update
    if @bookmark.update(bookmark_params)
      redirect_to @bookmark
    else
      render :edit
    end
  end

  def destroy
    @bookmark.destroy
    redirect_to bookmarks_url
  end

  private

    def bookmark_params
      params.require(:bookmark).permit(:name, :url, :user_id, tags_attributes: [:id, :name, :bookmark_id, :bookmark_counts, :user_id])
    end
end
