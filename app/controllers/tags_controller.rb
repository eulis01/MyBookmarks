class TagsController < ApplicationController
  
  def index
    @tags = Tag.all.includes(:bookmarks)
  end

  def show
    @tag = Tag.find_by_id(params[:id])
  end

  def new
  end

end
