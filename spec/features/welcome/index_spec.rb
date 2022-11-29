require 'rails_helper'

RSpec.describe 'landing page' do
  describe 'landing page- Has application title, button to create a new user, and index of existing users and a link back to the home page' do
    it 'has a landing page with an application title' do
      visit '/welcome'

      expect(page).to have_content('Viewing Party Lite')
    end

    it 'has a button to create a new user' do
      visit '/welcome'

      expect(page).to have_button('Create A New User')
    end

    it 'has a list of existing users which links to their dashboard' do
      visit '/welcome'
      user1 = User.create!(name: "Amanda", email: "amanda@turing.edu")
      user2 = User.create!(name: "James", email: "james@turing.edu")
      user3 = User.create!(name: "Pat", email: "pat@turing.edu")
      expect(page).to have_content("Existing Users")
      expect(page).to have_content(user1.name)
      expect(page).to have_content(user1.email)
      #save_and_open_page

    end
  end
end
