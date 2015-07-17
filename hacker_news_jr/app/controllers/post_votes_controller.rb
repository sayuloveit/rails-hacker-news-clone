class PostVotesController < ApplicationController

  def create
    vote = PostVote.new(user_id: session[:user_id], post_id: params[:post_id], like: params[:vote] )
    # byebug
    if vote.save
      if request.xhr?

      else
        redirect_to root_path
      end
    else
      # add error to tell user that they already voted for the post
      redirect_to root_path
    end
  end

  private

end
