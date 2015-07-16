module UserHelper

  def find_user_posts(user)
    user.posts
  end

  def find_user_comments(user)
    user.comments
  end

end
