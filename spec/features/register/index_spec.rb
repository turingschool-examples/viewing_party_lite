require 'rails_helper'

RSpec.describe 'Register' do
  before(:each) do
    visit '/register'
  end
  describe 'registration form' do
    it 'has fields for a name and email and a button to register' do
      expect(page).to have_field('Name')
      expect(page).to have_field('Email')
      expect(page).to have_button('Register')
    end

    describe 'happy path' do
      it 'creates a new user and redirects to the show page for that user when the form is successfully submitted' do
        fill_in 'Name', with: 'John Doe'
        fill_in 'Email', with: 'johndoe123@email.com'
        click_button 'Register'

        new_user = User.find_by(name: 'John Doe')
        expect(page).to have_current_path(user_path(new_user))
        expect(new_user.email).to eq('johndoe123@email.com')
      end
    end

    describe 'sad paths' do
      it 'does not create a new user if the submitted email is identical to an existing user email' do
        existing_user = User.create!(name: 'John Doe', email: 'johndoe123@email.com')
        fill_in 'Name', with: 'Imposter John'
        fill_in 'Email', with: 'johndoe123@email.com'
        click_button 'Register'

        expect(page).to have_current_path('/register')
        expect(User.exists?(name: 'Imposter John', email: 'johndoe123@email.com')).to eq(false)
      end
    end
  end
end
