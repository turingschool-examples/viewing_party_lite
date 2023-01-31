require 'rails_helper'

RSpec.describe 'user new' do
  before :each do 
    visit '/register' 
  end

  describe 'happy path' do 
    it 'displays user registration form' do 
      expect(page).to have_field('Name')
      expect(page).to have_field('Email')
      expect(page).to have_button('Submit')
    end

    it 'redirects visitor to user show page upon succesful registration' do 
      fill_in 'Name', with: 'test user'
      fill_in 'Email', with: 'testuser@example.com'
      click_button('Submit')
      expect(current_path).to eq(user_path(User.last.id))
    end
  end
end