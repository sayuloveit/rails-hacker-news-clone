module ApplicationHelper
  def show_edit_actions(object)
    @current_user.id == object.user.id
  end
end
