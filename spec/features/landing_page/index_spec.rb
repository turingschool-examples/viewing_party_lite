require 'rails_helper'

describe 'landing page' do
  describe 'display' do
    it 'has a title of application' do
      visit root_path
      expect(page).to have_content('Viewing Party')
    end

    xit 'has a button to create a new user' do
      visit root_path
      within '.new_user' do
        expect(page).to have_button('Create a New User')
        click_button 'Create a New User'
      end
      expect(current_path).to eq('/register')
    end

    it 'list of existing users which link to the users dashboard' do
      user = User.create(name: 'Sam', email: 'sam@supercool.edu')
      visit root_path
      expect(page).to have_link("#{user.name}'s Dashboard")
      click_on "#{user.name}'s Dashboard"
      expect(current_path).to eq("/users/#{user.id}")
    end

    it 'header link to go back to landing page' do
      user = User.create(name: 'Sam', email: 'sam@supercool.edu')
      visit root_path
      click_on 'Home'
      expect(current_path).to eq('/')
    end
  end
end
