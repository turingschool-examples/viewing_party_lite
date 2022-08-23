require 'rails_helper'

RSpec.describe 'landing page' type: :feature do
  before :each do
    @user1 = User.create!(name: "Bob", email: "bob@turing.edu")
    @user2 = User.create!(name: "Sally", email: "sally@turing.edu")
    @user3 = User.create!(name: "Mike", email: "mike@turing.edu")
    visit root_path
  end

  it 'has an application title' do
    expect(page).to have_content("Viewing Party")
  end

  it 'has a button to create a new user' do
    click_button "Create New User"
    expect(current_path).to eq(register_path)
  end

  it 'has a list of existing users and links to users dashboard' do
    expect(page).to have_link("Bob")
    expect(page).to have_link("Sally")
    expect(page).to have_link("Mike")
    click_link "Bob"
    expect(current_path).to eq(user_path(bob))
  end

  it 'has a link to landing page' do
    expect(page).to have_link("Home Page")
    click_link "Home Page"
    expect(current_path).to eq(root_path)
  end

end

# When a user visits the root path they should be on the landing page ('/') which includes:

#  Title of Application
#  Button to Create a New User
#  List of Existing Users which links to the users dashboard
#  Link to go back to the landing page (this link will be present at the top of all pages)