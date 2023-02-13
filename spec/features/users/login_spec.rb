require 'rails_helper'

RSpec.describe 'User login Page' do
  describe 'Logging in happy path' do
    it 'can log a user in who is already registered, with good credentials' do
      user = create(:user)
      
      visit root_path
  
      expect(page).to have_link("I already have an account")

      click_on("I already have an account")
      expect(current_path).to eq('/login')

      fill_in('Email', with: "#{user.email}")
      fill_in('Password', with: "#{user.password}")
      click_on("Log In")

      expect(current_path).to eq(user_path(user))
    end
  end

  describe 'Logging in sad path' do
    it 'will not log a user in with bad credentials' do
      user = create(:user)
      
      visit root_path
  
      expect(page).to have_link("I already have an account")

      click_on("I already have an account")
      expect(current_path).to eq(login_path)

      fill_in('Email', with: "#{user.email}")
      fill_in('Password', with: 'incorrect password')
      click_on("Log In")

      expect(current_path).to eq(login_path)
      expect(page).to have_content("Sorry, your credientials are bad.")
    end
  end
end