module BookmarksHelper

  # Find the bookmark ID and set it to the @bookmark instance variable if it exists else if not flash an error message.
  def set_bookmark 
    @bookmark = Bookmark.find_by(id: params[:id])
    if !@bookmark
      flash[:message] = "That bookmark doesn't exist"
      redirect_to bookmarks_path
    end
  end
  
  # First call set_bookmark an then redirect only if bookmark instance variable is not set or if current_user user_id is not equal to the user_id of the bookmark.
  def set_bookmark_owner
    set_bookmark
    redirect_to bookmarks_path if !@bookmark || @bookmark.user != current_user 
  end
end
