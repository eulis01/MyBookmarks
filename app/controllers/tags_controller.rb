class TagsController < ApplicationController
  before_action :redirect_if_not_logged_in
  before_action :set_tag, except: [:index, :new, :create]
  before_action :set_tag_owner, only: [:edit, :update, :destroy]
  
  def index
    if params[:bookmark_id] && @bookmark = Bookmark.find_by_id(params[:bookmark_id])
    @tags = @bookmark.tags
    else
      @error = "That Bookmark doesn't exist" if params[:bookmark_id]
      @tags = Tag.all
    end
  end

  def show
  end

  def new
    if params[:bookmark_id] && @bookmark = Bookmark.find_by_id(params[:bookmark_id])
      @tag = @bookmark.tags.build
    else
      @error = "That Bookmark doesn't exist" if params[:bookmark_id]
      @tag = Tag.new
    end
  end

  def create 
    @tag = current_user.tags.build(tag_params)
    if @tag.save
      redirect_to tags_path
    else
      render :new
    end
  end

  def edit
    @tag.build_bookmark if !@tag.bookmark
  end

  def update
    if @tag.update(tag_params)
      redirect_to tag_path(@tag)
    else
      render :edit
    end
  end

  def destroy
    @tag.destroy
    redirect_to tags_path
  end

  private

    def tag_params
      params.require(:tag).permit(:name, :bookmark_id)
    end
end
