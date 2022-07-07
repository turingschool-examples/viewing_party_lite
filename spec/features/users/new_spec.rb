require 'rails_helper'

RSpec.describe 'New User Form' do 
  describe 'happy path' do 
    it 'has a form to make a new user' do 
      visit register_path

      fill_in 'Name', with: 'Zachary'
      fill_in 'Email', with: 'superbadismyfave@yahoo.com'
      click_on 'Register'

      user = User.last
      expect(current_path).to eq(user_path(user.id))
      expect(page).to have_content("Welcome, #{user.name}!")
    end 
  end

  describe 'sad path' do 
    
  end
end