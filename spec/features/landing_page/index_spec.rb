require 'rails_helper'

RSpec.describe 'Landing Page' do


  # When a user visits the root path they should be on the landing page ('/') which includes:
  #
  #  Title of Application
  #  Button to Create a New User
  #  List of Existing Users which links to the users dashboard
  #  Link to go back to the landing page (this link will be present at the top of all pages)
  it 'displays the application title, create new user, users and landing page link' do
    user_1 = User.create!(name: 'Charles', email:'charlie@gmail.com')
    user_2 = User.create!(name: 'Sally', email:'sally@gmail.com')

    visit '/'
    expect(page).to have_content('Viewing Party Lite')
    expect(page).to have_button('Create New User')

    within "#user-1#{user_1.id}" do
      expect(page).to have_content('Charles')
      click_link 'User Dashboard'
      expect(current_path).to eq("/users/#{user_1.id}")
    end

    within "#user-2#{user_2.id}" do
      expect(page).to have_content('Sally')
      click_link 'User Dashboard'
      expect(current_path).to eq("/users/#{user_2.id}")
    end

    click_link 'Home'
    expect(current_path).to eq('/')
  end

end
