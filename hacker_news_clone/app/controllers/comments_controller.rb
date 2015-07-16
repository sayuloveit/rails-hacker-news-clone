class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params.merge({user_id: session[:user_id]}))
    post = Post.find_by_id(params[:post_id])
    # add error handling
    # byebug
    post.comments << comment
    redirect_to post_path(post)
  end


  private
  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end
