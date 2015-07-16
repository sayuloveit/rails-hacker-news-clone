class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params.merge({user_id: session[:user_id]}))
    post = Post.find_by_id(params[:post_id])
    # add error handling
    # right now unlogged in users will not able to add comment (even though they can see it)
    # since their comment's user_id will be nil, so it will not save
    # they will then be redirected to back to the post page
    post.comments << comment
    redirect_to post_path(post)
  end


  private
  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end
