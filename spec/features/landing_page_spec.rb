require 'rails_helper'

RSpec.describe "Home page", type: :feature do
  it 'has a title of the application' do
    visit "/"

    expect(page).to have_content("Viewing Party!")
  end

  it 'has a button to create a new user' do
    visit "/"

    click_button("Create New User")
    expect(current_path).to eq("/users/register")
  end

  it 'lists all existing users' do
    user1 = User.create!(name: "Susan", email: "susan@mail.com")
    user2 = User.create!(name: "Tyler", email: "tyler@mail.com")
    user3 = User.create!(name: "Sherman", email: "sherman@mail.com")

    User.all.each do |user|
      visit "/"
      expect(page).to have_content(user.name)
      click_link("#{user.name}")
      expect(current_path).to eq("/users/#{user.id}")
    end
  end

  it 'has a link to return to home page' do
    visit "/"

    click_on("Home")
    expect(current_path).to eq("/")
  end
end
