require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let! (:test_user) { User.create!(username: 'tester', password: 'password') }
  let! (:sample_post) { test_user.posts.create(title: 'google', url: 'www.google.com') }

   before :each do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(test_user)
  end

  describe '#index' do
    it 'assigns @posts' do
      get :index
      expect(assigns(:posts)).to eq([sample_post])
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe '#show' do
    it 'assigns a post' do
      get :show, id: sample_post.id
      expect(assigns(:post)).to eq(sample_post)
    end

    it 'renders the show template' do
      get :show, id: sample_post.id
      expect(response).to render_template('show')
    end
  end

  describe '#update' do
    it 'saves a valid update' do
      put :update, {id: sample_post.id, post: { title: 'G', url: 'www.google.com' }}
      expect(response).to redirect_to post_path(sample_post.reload)
    end

    it "won't save a bad update" do
      old_title = sample_post.title
      put :update,  {id: sample_post.id, post: { title: 'G', url: ''} }
      expect(response).to render_template("edit")
      expect(sample_post.reload.title).to eq(old_title)
    end
  end

  describe "#delete" do
    it "deletes a post" do
      old_count = Post.count
      delete :destroy, id: sample_post.id
      expect(response).to redirect_to(root_path)
      expect(Post.count).to eq(old_count - 1)
      expect(Post.where(id: sample_post.id).count).to eq(0)
    end
  end

end
