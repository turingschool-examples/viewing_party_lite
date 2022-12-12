require 'rails_helper'

RSpec.describe 'landing page', type: :feature do
  describe 'landing page- Has application title, button to create a new user, and index of existing users and a link back to the home page' do
    it 'has a landing page with an application title' do
      visit '/'

      expect(page).to have_content('Viewing Party Lite')
    end

    it 'has a button to create a new user' do
      visit '/'

      expect(page).to have_button('Create A New User')
    end

    it 'has a list of existing users which links to their dashboard' do
      user1 = User.create!(name: 'Amanda', email: 'amanda@turing.edu', password: 'amanda')
      user2 = User.create!(name: 'James', email: 'james@turing.edu', password: 'james')
      user3 = User.create!(name: 'Pat', email: 'pat@turing.edu', password: 'pat')
      visit '/'
      expect(page).to have_content('Existing Users')
      expect(page).to have_content(user1.name)
      expect(page).to have_content(user1.email)
      expect(page).to have_link('amanda@turing.edu', href: user_path(user1))
      expect(page).to have_link('james@turing.edu', href: user_path(user2))
      expect(page).to have_link('pat@turing.edu', href: user_path(user3))
    end

    it 'has a link to return to the welcome page at the top of every page' do
     visit '/'
     expect(page).to have_link("Home")
    end
  end
end
