module PostVotesHelper

  def upvote_count(post_obj)
    post_obj.post_votes.where(like: true).count
  end

  def downvote_count(post_obj)
    post_obj.post_votes.where(like: false).count
  end
end
