require 'rails_helper'

RSpec.describe 'landing page' do

  describe 'display' do
    it 'shows the title of the application' do
      visit root_path
      expect(page).to have_content('Viewing Party Lite')
    end

    it 'shows a button to create a new user' do
      visit root_path
      click_link 'Create New User'

      expect(current_path).to eq "/users/new"
    end

    it 'shows existing user list that is linked to respective user dashboard' do
      user = User.create(name: 'Michael', email: 'michael@example.net')
      visit root_path

      within(".users") do
        click_link "#{user.name}"
      end
      
      expect(current_path).to eq("/users/#{user.id}")
    end

    it 'shows a header link redirecting to landing page' do
      visit new_user_path
      click_on 'Home'
      expect(current_path).to eq('/')
    end

  end

end
