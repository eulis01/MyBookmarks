class TagsController < ApplicationController
  before_action :redirect_if_not_logged_in
  before_action :set_tag, only: except: [:index, :new, :create]
  before_action :set_tag_owner, only: [:edit, :update, :destroy]
  
  def index
    @tags = Tag.all.includes(:bookmarks)
  end

  def show
    @tag = Tag.find_by_id(params[:id])
  end

  def new
  end

  def create 
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def tag_params
      params.require(:tag).permit(:name)
    end

    def set_tag
      @tag = Tag.find_by_id(params[:id])
    end

    def set_tag_owner
      set_tag
      redirect_to tags_path if !@tag || @tag.user_id != current_user.id
    end

end
