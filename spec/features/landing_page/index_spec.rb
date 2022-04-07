require 'rails_helper'

describe 'landing page' do
  describe 'display' do
    it 'has a title of application' do
      visit root_path
      expect(page).to have_content('Viewing Party')
    end

    it 'has a button to create a new user' do
      visit root_path
      within '.new_user' do
        expect(page).to have_button('Create a New User')
        click_button 'Create a New User'
      end
      expect(current_path).to eq('/register')
    end

    it 'list of existing users which link to the users dashboard' do
      user = User.create(name: 'Sam', email: 'sam@supercool.edu', password: '1234')
      visit root_path
      expect(page).to have_link("#{user.name}'s Dashboard")
      click_on "#{user.name}'s Dashboard"
      expect(current_path).to eq("/users/#{user.id}")
    end

    it 'header link to go back to landing page' do
      user = User.create(name: 'Sam', email: 'sam@supercool.edu', password: '1234')
      visit root_path
      click_on 'Home'
      expect(current_path).to eq('/')
    end

    it 'has a link thats logs user in' do
      visit '/register'
      fill_in 'Name', with: 'Sam'
      fill_in 'Email', with: 'sam@supercool.edu'
      fill_in 'Password', with: '1234'
      fill_in 'Password confirmation', with: '1234'
      click_on 'Register'

      visit '/'
      click_button 'Login'
      expect(current_path).to eq('/login')
      fill_in :email, with: 'sam@supercool.edu'
      fill_in :password, with: '1234'
      click_button 'Submit'
      test_user = User.first

      expect(current_path).to eq("/users/#{test_user.id}")
    end

    it 'sad path, email is wrong' do
      visit '/register'
      fill_in 'Name', with: 'Sam'
      fill_in 'Email', with: 'sam@supercool.edu'
      fill_in 'Password', with: '1234'
      fill_in 'Password confirmation', with: '1234'
      click_on 'Register'

      visit('/login')
      fill_in :email, with: 'sam@superlame.edu'
      fill_in :password, with: '1234'
      click_button 'Submit'
      expect(current_path).to eq('/login')
      expect(page).to have_content("No user exists with email 'sam@superlame.edu'.")
    end

    it 'sad path, password wrong' do
      visit '/register'
      fill_in 'Name', with: 'Sam'
      fill_in 'Email', with: 'sam@supercool.edu'
      fill_in 'Password', with: '1234'
      fill_in 'Password confirmation', with: '1234'
      click_on 'Register'

      visit '/login'
      fill_in :email, with: 'sam@supercool.edu'
      fill_in :password, with: '2222'
      click_button 'Submit'
      expect(current_path).to eq('/login')
      expect(page).to have_content('Sorry, your credentials are bad.')
    end
  end
end
