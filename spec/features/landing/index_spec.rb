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
    user_1 = User.create!(name: 'User 1', email: 'email1@gmail.com')
    user_2 = User.create!(name: 'User 2', email: 'email2@gmail.com')
    user_3 = User.create!(name: 'User 3', email: 'email3@gmail.com')
    visit root_path
    save_and_open_page
    expect(page).to have_content("#{user_1.email}'s Dashboard")
    expect(page).to have_content("#{user_2.email}'s Dashboard")
    expect(page).to have_content("#{user_3.email}'s Dashboard")
  end

  it "has list of existing users as links" do
    user_1 = User.create!(name: 'User 1', email: 'email1@gmail.com')
    user_2 = User.create!(name: 'User 2', email: 'email2@gmail.com')
    user_3 = User.create!(name: 'User 3', email: 'email3@gmail.com')
    visit root_path
    click_link("#{user_1.email}'s Dashboard")
    expect(current_path).to eq(user_path(user_1))
  end


  it "has link to return to landing page" do
    visit '/'
    click_link 'Home'
    expect(current_path).to eq('/')
  end

end
