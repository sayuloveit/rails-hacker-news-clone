require 'rails_helper'

describe "the signup process", :type => :feature do

  it "user can login and then get redirected to main page" do
    User.create(:username => 'user@example.com', :password => 'password')
    visit '/login'
    within(".login") do
      fill_in 'Username', :with => 'user@example.com'
      fill_in 'Password', :with => 'password'
    end
    click_button 'login'
    expect(page).to have_content 'Welcome to Hacker News Jr'
  end

  it "user can sign up and then get redirected to main page" do
    visit '/login'
    within(".signup") do
      fill_in 'Username', :with => 'user@example.com'
      fill_in 'Password', :with => 'password'
    end
    click_button 'signup'
    expect(page).to have_content 'Welcome to Hacker News Jr'
  end

end
