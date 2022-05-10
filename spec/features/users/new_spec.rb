require 'rails_helper'

describe 'Creating a user' do
  before :each do 
    visit '/register'

    @phil = User.create!(name: 'Philly Steak', email: 'philly.steak@gmail.com')
  end

  context 'when valid data is entered' do
    it 'creates a user' do
      fill_in :name, with: 'Billy Jonson'
      fill_in :email, with: 'billy.jonson@gmail.com'
      click_button 'Register'
      
      user = User.last
      expect(current_path).to eq(user_path(user))
    end
  end

  context 'when invalid data is entered' do
    it 'email must be unique' do
      fill_in :name, with: 'Phil'
      fill_in :email, with: 'philly.steak@gmail.com'
      click_button 'Register'

      expect(page).to have_content('Notice: email is invalid')
      expect(page).to have_content('Register a new User')
    end

    it 'fields can not be blank' do
      fill_in :name, with: 'Phil'
      click_button 'Register'

      expect(page).to have_content('Notice: fields can not be blank')
      expect(page).to have_content('Register a new User')
    end
  end
end
