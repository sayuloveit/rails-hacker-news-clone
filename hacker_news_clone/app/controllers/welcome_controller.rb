class WelcomeController < ApplicationController
  def index
    @posts = Post.order(:id)
  end
end
