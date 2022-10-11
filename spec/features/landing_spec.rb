require 'rails_helper'

RSpec.describe 'Landing Page' do
  describe 'When a user visits the root path' do
    before :each do
      visit '/'
    end

    let!(:user1) {User.create!(name: 'Ben', email: 'ben@fakemail.com', password: 'password')}

    it 'should be on the landing page with title' do
      expect(page).to have_content('Viewing Party')
    end

    it 'should have button to create a new user' do
      expect(page).to have_button('Create New User')

      click_button 'Create New User'

      expect(current_path).to eq('/user/new')
    end

    it 'has section for existing users' do
      expect(page).to have_content('Existing Users')

      within("#existing_users") do
        expect(page).to have_link(user1.email)
      end
    end

    it 'has a home link at top of page' do
      expect(page).to have_link('Home')

      click_link 'Home'

      expect(current_path).to eq('/')
    end
  end
end