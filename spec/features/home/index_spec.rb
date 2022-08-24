require 'rails_helper'

RSpec.describe 'home page' do
  before :each do
    @user1 = User.create!(name: "Jim Bob", email: "jimb@viewingparty.com")
    @user2 = User.create!(name: "Cary Berry", email: "caryb@viewingparty.com")

    visit root_path
  end

  it 'title of application, links to existing user, button to create a new user' do
    expect(page).to have_content("Viewing Party Lite")
    expect(page).to have_button("Create a New User")
    expect(page).to have_link("Jim Bob")
    expect(page).to have_link("Cary Berry")
    expect(page).to have_link("Home")
    expect(page).to_not have_link('Tyler')
  end

  it 'can direct to create a new user' do
    click_button("Create a New User")
    expect(current_path).to eq("/register")
    fill_in "Name", with: "Tyler"
    fill_in "Email", with: "tyler@user.com"
    click_on('Submit')
    expect(current_path).to eq(root_path)
  end

  it 'has an index of existing users' do
    within("#user-#{@user1.id}") do
      expect(page).to have_link("Jim Bob")
      click_link("Jim Bob")
      expect(current_path).to eq("/users/#{@user1.id}")
    end
      expect(page).to have_content("Jim Bob's Dashboard")
  end
end
