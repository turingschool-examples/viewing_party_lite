require 'rails_helper'

describe 'welcome page' do

  describe 'display' do
    it 'title of application' do
      visit root_path
      expect(page).to have_content("Friends and Movies")
    end

    it 'button to create a new user' do
      visit root_path
      click_link 'Create New User'
      expect(current_path).to eq new_user_path
    end

    it 'list of existing users which link to the users dashboard' do
      user = User.create(name:'Gunnar', email:'gunnar@faker.net')

      visit root_path
      click_on "#{user.email}"
      expect(current_path).to eq(user_path(user.id))
    end

    it 'header link to go back to landing page' do
      visit new_user_path
      click_on 'Home'
      expect(current_path).to eq('/')
    end
  end
end
