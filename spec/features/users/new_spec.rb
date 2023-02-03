require 'rails_helper'

RSpec.describe 'User registration page' do
  describe 'happy path' do
    it 'creates/registers new user' do
      visit register_path

      expect(page).to have_field('user[name]')
      expect(User.all).to eq([])
      expect(User.count).to eq(0)

      fill_in 'user[name]', with: 'Kaylah Rose'
      fill_in 'user[email]', with: '1234@valid.com'
      click_button 'Register'

      expect(User.count).to eq(1)
      expect(current_path).to eq(user_path(User.last))
      expect(page.status_code).to eq 200
    end
  end

  describe 'sad path' do
    it 'does not create a new user with empty name field' do
      visit register_path
      expect(User.all).to eq([])
      expect(User.count).to eq(0)

      fill_in 'user[email]', with: '1234@ldskfj'

      click_button 'Register'

      expect(User.all).to eq([])
      expect(User.count).to eq(0)
      expect(current_path).to eq(register_path)
      expect(page).to have_content("Name can't be blank")
      expect(page).to have_button('Register')
      expect(page.status_code).to eq 200
    end

    it 'does not create a user with empty email field' do
      visit register_path
      expect(User.all).to eq([])
      expect(User.count).to eq(0)

      fill_in 'user[name]', with: '1234@ldskfj'

      click_button 'Register'

      expect(User.all).to eq([])
      expect(User.count).to eq(0)
      expect(current_path).to eq(register_path)
      expect(page).to have_content("Email can't be blank")
      expect(page).to have_button('Register')
      expect(page.status_code).to eq 200
    end

    it 'does not create a user with empty name and email fields' do
      visit register_path
      expect(User.all).to eq([])
      expect(User.count).to eq(0)

      click_button 'Register'

      expect(User.all).to eq([])
      expect(User.count).to eq(0)
      expect(current_path).to eq(register_path)
      expect(page).to have_content("Name can't be blank")
      expect(page).to have_content("Email can't be blank")
      expect(page).to have_button('Register')
      expect(page.status_code).to eq 200
    end

    it 'does not create a user with duplicate email' do
      user1 = User.create!(name: 'dsflkj', email: '1234@valid.com')
      visit register_path

      expect(page).to have_field('user[name]')
      expect(User.all).to eq([user1])
      expect(User.count).to eq(1)

      fill_in 'user[name]', with: 'Kaylah Rose'
      fill_in 'user[email]', with: '1234@valid.com'
      click_button 'Register'

      expect(User.all).to eq([user1])
      expect(User.count).to eq(1)
      expect(page).to have_content('Email has already been taken')
      expect(page.status_code).to eq 200
    end
  end
end
