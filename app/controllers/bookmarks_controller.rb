class BookmarksController < ApplicationController
  before_action :redirect_if_not_logged_in 
  before_action :set_bookmark, except: [:index, :new, :create]
  def index
    @bookmarks = Bookmark.all
  end

  def show
    redirect_to bookmarks_path if !@bookmark
  end

  def new
    if params[:user_id] && @user = User.find_by_id(params[:user_id])
      @bookmark = @user.bookmarks.build
    else
      @bookmark = Bookmark.new
    end
    @bookmark.build_user
  end

  def create
    @bookmark = current_user.bookmarks.build(bookmark_params)
    if @bookmark.save
      flash[:notice] = "Bookmark was successfully created."
      redirect_to bookmarks_path
    else
      render :new
    end
  end

  def update
    redirect_to bookmarks_path if !@bookmark || @bookmark.user != current_user
    if @bookmark.update(bookmark_params)
      flash[:notice] = "Bookmark was successfully updated."
      redirect_to @bookmark
    else
      render :edit
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to bookmarks_url, notice: 'Bookmark was successfully destroyed.'
  end

  private

    def bookmark_params
      params.require(:bookmark).permit(:name, :url, :tag_id, tag_attributes: [:name])
    end
    
    def set_bookmark 
      @bookmark = Bookmark.find_by(id: params[:id])
    end
end
