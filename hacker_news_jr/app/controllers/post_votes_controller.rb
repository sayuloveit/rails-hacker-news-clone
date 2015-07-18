class PostVotesController < ApplicationController

  def create
    # byebug
    vote = PostVote.new(user_id: session[:user_id], post_id: params[:post_id], like: params[:vote] )
    if vote.save
      vote_count = Post.find_by(id: params[:post_id].to_i).post_votes.count
      # byebug
      if request.xhr?
        {vote_count: vote_count}.to_json
      else
        redirect_to root_path
      end
    else
      # byebug
      # add error to tell user that they already voted for the post
      redirect_to root_path
    end
  end

  private

end
