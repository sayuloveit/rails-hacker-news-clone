module ApplicationHelper
  def show_edit_actions(object)
    @current_user.id == object.user.id
  end

  def find_username(object)
    object.user.username
  end

  def find_user(object)
    object.user
  end

end
