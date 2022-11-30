require 'rails_helper'

RSpec.describe 'new user page' do
  describe 'when I visit /register I see a form to create a new user' do
    it 'takes me to the new user path' do
      visit '/register'
      expect(current_path).to eq(register_path)
    end
  end

  before :each do
    visit register_path
  end

  describe 'when I visit new_user_path' do
    it 'has a form to register a new user' do
      within '#new_user_form' do
        expect(page).to have_selector(:css, 'form')
        expect(page).to have_content('Name:')
        expect(page).to have_field(:name)
        expect(page).to have_content('Email:')
        expect(page).to have_field(:email)
        expect(page).to have_button('Register')
      end
    end

    it 'redirects to /users/:id when I hit register' do
      within '#new_user_form' do
        fill_in(:name, with: Faker::Games::Pokemon.name)
        fill_in(:email, with: Faker::Internet.email)
        click_button('Register')
      end

      new_user = User.last
      expect(current_path).to eq(user_path(new_user))
      expect(page).to have_content(new_user.name)
    end

    it 'will redirect back to registration page if information is not entered correctly' do
      within '#new_user_form' do
        fill_in(:name, with: Faker::Games::Pokemon.name)
        click_button('Register')
      end

      expect(current_path).to eq(register_path)
    end

    it 'will not accept a duplicate email address' do
      user1 = create(:user, email: 'bob@yahoo.com')

      within '#new_user_form' do
        fill_in(:name, with: Faker::Games::Pokemon.name)
        fill_in(:email, with: 'bob@yahoo.com')
        click_button('Register')
      end

      expect(User.last).to eq(user1)
      expect(current_path).to eq(register_path)
    end
  end
end

# commented out for later
# let!(:user1) { create(:user) }
# let!(:user2) { create(:user) }
# let!(:user3) { create(:user) }
# let!(:party1) { create(:viewing_party) }
# let!(:user_party1) { create(:user_party, user: user1, viewing_party: party1) }
