class FoldersController < ApplicationController
  before_action :redirect_if_not_logged_in 
  before_action :set_folder, except: [:index, :new, :create]
  
  def index
    @folders = current_user.folders
    @folders = Folder.all
  end

  def create
    current_user.folders.create(folder_params)
    redirect_to folders_path
  end

  def destroy
    folder = Folder.find(params[:id])
    folder.destroy
    redirect_to folders_path
  end

private
  def folder_params
    params.require(:folder).permit(:name)
  end
end
