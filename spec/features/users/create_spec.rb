require 'rails_helper'

RSpec.describe 'User Registration' do
  describe 'when a user visits /register' do
    before(:each) do
      visit '/register'
    end

    it 'they see a form to create a new user' do
      expect(page).to have_content("We're excited to have you join us, please fill out this form!")
    end

    it 'the form includes fields for name and email' do
      expect(page).to have_field(:name)
      expect(page).to have_field(:email)
    end

    describe 'when I fill out that form with the correct information and hit submit' do
      before(:each) do
        fill_in 'Name', with: 'Jon Duttko'
        fill_in 'Email', with: 'jduttko149@gmail.com'
      end
      it 'I am taken to the dashboard page for that user' do
        click_button 'Submit'
        expect(current_path).to eq(user_path(User.last))
      end
    end

    describe 'when I do not fill out every field and click submit' do
      before(:each) do
        fill_in 'Email', with: 'jduttko149@gmail.com'
      end
      it 'returns me to the new user form' do
        click_button 'Submit'
        expect(current_path).to eq('/register')
      end
      it 'flashes a message saying all fields must contain information' do
        click_button 'Submit'
        expect(page).to have_content("Name can't be blank")
      end
    end

    describe 'when I add a non-unique email and click submit' do
      before(:each) do
        User.create!(name: 'Matt Duttko', email: 'jduttko149@gmail.com')
        fill_in 'Name', with: 'Jon Duttko'
        fill_in 'Email', with: 'jduttko149@gmail.com'
      end
      it 'returns me to the new user form' do
        click_button 'Submit'
        expect(current_path).to eq('/register')
      end

      it 'flashes a message that an email cannot be used twice' do
        click_button 'Submit'
        expect(current_path).to eq('/register')
        expect(page).to have_content('Email has already been taken')
      end
    end
  end
end
