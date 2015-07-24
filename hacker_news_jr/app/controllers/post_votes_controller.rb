class PostVotesController < ApplicationController

  def create
    vote = PostVote.new(user_id: session[:user_id], post_id: params[:post_id], like: params[:vote] )
    if vote.save && request.xhr?
      vote_count = Post.find_by(id: params[:post_id].to_i).post_votes.count
      render json: {post_id: vote.post.id, vote_count: vote_count}.to_json
    else
      # byebug
      # add error to tell user that they already voted for the post
      redirect_to root_path
    end
  end

  private

end
