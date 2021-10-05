class TagsController < ApplicationController
  before_action :redirect_if_not_logged_in
  before_action :set_tag, only: except: [:index, :new, :create]
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

    def set_tag
      @tag = Tag.find_by_id(params[:id])
      if !@tag
        flash[:message] = "That tag doesn't exist"
        redirect_to tags_path
      end
    end

    def set_tag_owner
      set_tag
      redirect_to tags_path if !@tag || @tag.user_id != current_user.id
    end

end
