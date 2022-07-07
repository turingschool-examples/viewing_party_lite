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
    it 'has an error message if information is missing' do 
      visit register_path
      expect(page).to have_content("Create an Account")

      fill_in 'Name', with: ''
      fill_in 'Email', with: 'superbadismyfave@yahoo.com'
      click_on 'Register'

      user = User.last
      expect(current_path).to eq(register_path)
      expect(page).to have_content("Cannot register, missing information")
    end

    xit 'has an error message if email is already in use' do 

    end
  end
end