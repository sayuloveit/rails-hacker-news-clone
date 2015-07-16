class PostsController < ApplicationController

  def index
    @posts = Post.order(created_at: 'desc')
  end

  def new
    @post = Post.new
  end

  def create
    user = User.find_by_id(session[:user_id])
    post = Post.new(post_params)

    user.posts << post
    redirect_to root_path
  end

  private
  def post_params
     params.require(:post).permit(:title, :url)
  end

end
