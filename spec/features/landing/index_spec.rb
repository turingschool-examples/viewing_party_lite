require 'rails_helper'

RSpec.describe 'landing page', type: :feature do

  it 'has a landing page with title of application' do
    visit '/'

    expect(page).to have_content("Viewing Party Lite")
  end

  it 'has button to create new user' do
    visit '/'

    click_on "Create a New User"

    expect(current_path).to eq("/register")
  end

  it 'displays list of existing users, with links to each user\'s dashboard' do
    user1 = User.create!(first_name: "David", last_name: "Lynch", email: "david-fake@test.com")

    user2 = User.create!(first_name: "Steven", last_name: "Spielberg", email: "steven-fake@test.com")

    user3 = User.create!(first_name: "Greta", last_name: "Gerwig", email: "greta-fake@test.com")

    visit '/'

    within "#existing-users" do
      expect(page).to have_content("david-fake@test.com's Dashboard")
      expect(page).to have_content("steven-fake@test.com's Dashboard")
      expect(page).to have_content("greta-fake@test.com's Dashboard")
    end

    click_on "david-fake@test.com's Dashboard"

    expect(current_path).to eq("/users/#{user1.id}")
  end

  it 'has link to return to landing page, which is present on all pages' do
    user1 = User.create!(first_name: "David", last_name: "Lynch", email: "david-fake@test.com")
    
    visit '/'

    within "#page-header" do
      expect(page).to have_content("Home")
      click_on("Home")
    end

    expect(current_path).to eq("/")

    click_on "david-fake@test.com's Dashboard"

    within "#page-header" do
      expect(page).to have_content("Home")
      click_on("Home")
    end

    expect(current_path).to eq("/")
  end

end