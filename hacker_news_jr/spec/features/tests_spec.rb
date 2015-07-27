require 'rails_helper'

describe "login and signup tests", :type => :feature do

  it "user can login and then get redirected to main page" do
    User.create(username: 'user', password: 'password')
    visit '/login'
    within(".login") do
      fill_in 'Username', :with => 'user'
      fill_in 'Password', :with => 'password'
    end
    click_button 'login'
    expect(page).to have_content 'Welcome to Hacker News Jr'
  end

  it "user can sign up and then get redirected to main page" do
    visit '/login'
    within(".signup") do
      fill_in 'Username', :with => 'user'
      fill_in 'Password', :with => 'password'
    end
    click_button 'signup'
    expect(page).to have_content 'Welcome to Hacker News Jr'
  end

  it "user can signout" do
    visit '/login'
    within(".signup") do
      fill_in 'Username', :with => 'user'
      fill_in 'Password', :with => 'password'
    end
    click_button 'signup'
    click_link 'signout'
    expect(page).to have_content 'login'
  end

end

describe "user post actions", :type => :feature do

  let! (:test_user) { User.create(username: 'tester', password: 'password') }

  before :each do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(test_user)
  end

  it "user can add a new post from the main page after logging in" do
    visit '/'
    click_link 'add new post'
    expect(page).to have_content 'Create a new Post!'
  end

  it "user can add new posts" do
    visit '/posts/new'
    within(".new_post") do
      fill_in 'Title', :with => 'the g'
      fill_in 'Url', :with => 'www.google.com'
    end
    click_button 'Create Post'
    expect(page).to have_content 'the g'
  end

  it 'user can delete their own post' do
    old_post_count = test_user.posts.count
    test_user.posts.create(title: 'google', url: 'www.google.com')
    new_post_count = test_user.posts.count
    visit "/users/#{test_user.id}"
    click_link 'destroy'
    expect(old_post_count).to eq(new_post_count - 1)
  end

  it 'user can edit their own post' do
    test_user.posts.create(title: 'google', url: 'www.google.com')
    visit "/users/#{test_user.id}"
    click_link 'edit'
    within(".edit_post") do
      fill_in 'Title', :with => 'the G'
    end
    click_button 'Update Post'
    expect(page).to have_content 'the G'
  end

end
