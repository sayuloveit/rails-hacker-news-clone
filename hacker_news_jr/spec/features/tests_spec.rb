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

end

describe "user post creation", :type => :feature do

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

end
