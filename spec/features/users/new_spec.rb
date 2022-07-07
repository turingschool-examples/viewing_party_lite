require 'rails_helper'

RSpec.describe 'New User Form' do
  describe 'happy path' do
    it 'has a form to make a new user' do
      visit register_path

      fill_in 'Name', with: 'Zachary'
      fill_in 'Email', with: 'superbadismyfave@yahoo.com'
      click_on 'Register'

      last_user = User.last
      expect(current_path).to eq(user_path(last_user.id))
      expect(page).to have_content("Welcome, #{last_user.name}!")
      expect(page).to_not have_content('Cannot register, missing or repeated information')
    end
  end

  describe 'sad path' do
    it 'has an error message if information is missing' do
      visit register_path
      expect(page).to have_content('Create an Account')

      fill_in 'Name', with: ''
      fill_in 'Email', with: 'superbadismyfave@yahoo.com'
      click_on 'Register'

      expect(current_path).to eq(register_path)
      expect(page).to have_content('Cannot register, missing or repeated information')
    end

    it 'has an error message if trying to enter an in-use email' do 
      user1 = User.create!(name: 'Zach', email: 'superbadismyfave@yahoozle.com')

      visit register_path
      expect(page).to have_content('Create an Account')

      fill_in 'Name', with: 'Zachary'
      fill_in 'Email', with: 'superbadismyfave@yahoozle.com'
      click_on 'Register'

      expect(current_path).to eq(register_path)
      expect(page).to have_content('Cannot register, missing or repeated information')
    end
  end
end
