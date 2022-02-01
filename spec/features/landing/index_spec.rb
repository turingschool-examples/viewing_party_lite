require 'rails_helper'

RSpec.describe 'Landing index page' do

  it 'has title of application' do
    visit '/'
    expect(page).to have_content('Viewing Party Lite')
  end

  it 'has button to create new user' do
    visit '/'
    click_button 'Create new user'
    expect(current_path).to eq('/users/new')
  end

  it "has list of existing users" do
    visit '/'
    user_1 = User.create!(name: 'User 1', email: 'email1@gmail.com')
    user_2 = User.create!(name: 'User 2', email: 'email2@gmail.com')
    user_3 = User.create!(name: 'User 3', email: 'email3@gmail.com')
    click_link("email1@gmail.com's Dashboard")
    expect(current_path).to eq("/users/#{user_1.id}")
  end

  it "has link to return to landing page" do
    visit '/'
    click_link 'Home'
    expect(current_path).to eq('/')
  end

end
