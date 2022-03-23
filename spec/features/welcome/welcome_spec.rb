require 'rails_helper'

RSpec.describe 'Welcome Page', type: :feature do
  it 'exists' do
    visit "/"
    expect(current_path).to eq("/")
    expect(page).to have_content("Viewing Party PRO")
  end

  it 'has a button to create a new user' do
    visit "/"

    expect(page).to have_link("Create new user")

    click_link "Create new user"

    expect(current_path).to eq("/register")
  end

  it 'lists all existing users as links to their own dashboards' do
    user1 = User.create!(name: "Katy", email: "katy.perry@turing.io", password: "0")
    user2 = User.create!(name: "Mark", email: "mark.twain@turing.io", password: "0")
    user3 = User.create!(name: "Joe", email: "joe.jonas@turing.io", password: "0")

    visit "/"

    expect(page).to have_content("Existing Users:")
    expect(page).to have_link("katy.perry@turing.io Dashboard")
    expect(page).to have_link("mark.twain@turing.io Dashboard")
    expect(page).to have_link("joe.jonas@turing.io Dashboard")

    click_link("james.grant@turing.io Dashboard")

    expect(current_path).to eq("/users/#{user3.id}")
  end

  it 'can be navigated to from any page' do
    user1 = User.create!(name: "Jesse", email: "jesse.owens@turing.io", password: "0")

    visit "/users/#{user1.id}"


    click_link("jesse.owens@turing.io Dashboard")

    expect(current_path).to eq("/users/#{user3.id}")
    # add more pages here for this test when more are built pls -Katy
  end
end
