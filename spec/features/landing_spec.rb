require 'rails_helper'

RSpec.describe 'the landing page', type: :feature do
  it 'displays name of the app' do
    visit '/'

    expect(page).to have_content("Viewing Party Lite")
  end

  it 'has button to create new user' do
    visit '/'

    expect(page).to have_button("Create New User")
    click_button("Create New User")
    expect(page).to have_current_path("/register")
  end

  it 'has list of existing users' do
    user1 = User.create!(name: 'Sai', email: 'SaiLent@overlord.com', password: "haisall123")
    user2 = User.create!(name: 'Deannah', email: 'DMB@donuts.com', password: "db123")

    visit '/'
    expect(page).to have_content("Existing Users")
      within "#user-0" do
        expect(page).to have_content("Sai")
        expect(page).to_not have_content("Deannah")
      end

      within "#user-1" do
        expect(page).to have_content("Deannah")
        expect(page).to_not have_content("Sai")
      end
    end

  it 'each existing user links to user dashboard' do
    user1 = User.create!(name: 'Sai', email: 'SaiLent@overlord.com', password: "haisall123")
    user2 = User.create!(name: 'Deannah', email: 'DMB@donuts.com', password: "db123")

    visit '/'
    click_link("Sai's Dashboard")
    expect(current_path).to eq("/users/#{user1.id}")
    expect(current_path).to_not eq("/users/#{user2.id}")
  end

  it 'has a link for existing user to login' do

    visit '/'

    click_link("Log In")

    expect(current_path).to eq('/login')
  end

  it 'user can login with proper credentials' do
    user1 = User.create!(name: 'Sai', email: 'SaiLent@overlord.com', password: "haisall123")

    visit '/login'

    fill_in :email, with: 'SaiLent@overlord.com'
    fill_in :password, with: 'haisall123'
    click_button("Log In")

    expect(current_path).to eq("/users/#{user1.id}")
    expect(page).to have_content("Welcome, Sai!")
  end
end
