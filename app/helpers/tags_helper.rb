module TagsHelper
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
