require 'rails_helper'

RSpec.describe 'new user page' do
  before :each do
    visit register_path
  end

  describe 'when I visit new_user_path' do
    it 'has a form to register a new user' do
      within '#new_user_form' do
        expect(page).to have_selector(:css, 'form')
        expect(page).to have_content('Name:')
        expect(page).to have_field(:user_name)
        expect(page).to have_content('Email:')
        expect(page).to have_field(:user_email)
        expect(page).to have_button('Register')
      end
    end

    it 'redirects to /users/:id when I hit register' do
      within '#new_user_form' do
        fill_in(:user_name, with: Faker::Games::Pokemon.name)
        fill_in(:user_email, with: Faker::Internet.email)
        password = Faker::Internet.password(min_length: 10, max_length: 20)
        fill_in(:user_password, with: password)
        fill_in(:user_password_confirmation, with: password)
        click_button('Register')
      end

      new_user = User.last
      expect(current_path).to eq(user_path(new_user))
      expect(page).to have_content(new_user.name)
    end

    it 'will not accept passwords that do not match' do
      within '#new_user_form' do
        fill_in(:user_name, with: Faker::Games::Pokemon.name)
        fill_in(:user_email, with: Faker::Internet.email)
        fill_in(:user_password, with: Faker::Internet.password(min_length: 10, max_length: 20))
        fill_in(:user_password_confirmation, with: Faker::Internet.password(min_length: 10, max_length: 20))
        click_button('Register')
      end

      expect(current_path).to eq(register_path)
      expect(page).to have_content('Required content missing or invalid')
    end

    it 'will redirect back to registration page if information is not entered correctly' do
      within '#new_user_form' do
        fill_in(:user_name, with: Faker::Games::Pokemon.name)
        click_button('Register')
      end

      expect(current_path).to eq(register_path)
    end

    it 'will not accept a duplicate email address' do
      user1 = create(:user, email: 'bob@yahoo.com')

      within '#new_user_form' do
        fill_in(:user_name, with: Faker::Games::Pokemon.name)
        fill_in(:user_email, with: 'bob@yahoo.com')
        click_button('Register')
      end

      expect(User.last).to eq(user1)
      expect(current_path).to eq(register_path)
    end
  end
end
