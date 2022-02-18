module TagsHelper

  # Find the tag ID and set it to the @tag instance variable if it exists else if not flash an error message.
  def set_tag
    @tag = Tag.find_by_id(params[:id])
    if !@tag
      flash[:message] = "That tag doesn't exist"
      redirect_to tags_path
    end
  end

  # First call set_tag an then redirect only if tag instance variable is not set or if current_user user_id is not equal to the user_id of the tag.
  def set_tag_owner
    set_tag
    redirect_to tags_path if !@tag || @tag.user_id != current_user.id
  end
end
