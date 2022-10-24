require 'rails_helper'

RSpec.describe 'user login' do
    # As a registered user
    # When I visit the landing page `/`
    # I see a link for "Log In"
    # When I click on "Log In"
    # I'm taken to a Log In page ('/login') where I can input my unique email and password.
    # When I enter my unique email and correct password 
    # I'm taken to my dashboard page

  describe 'User Login User Story' do
    before :each do
      @user_1 = create(:user, name: "Ken", email: "kenmail@goodemail.com", password: "testing123", password_confirmation: "testing123")
      @user_2 = create(:user, name: "Mary", email: "marymail@planetemail.org", password: "password9000", password_confirmation: "password9000")
    end

    it 'When I visit the landing page `/` I see a link for "Log In' do
      visit landing_page_path

      click_on 'Log In'

      expect(current_path).to eq(login_path)
    end

    it 'When I enter my unique email and correct password Im taken to my dashboard page' do
      visit login_path

      fill_in 'email', with: @user_1.email
      fill_in 'password', with: @user_1.password

      click_on 'Login'

      expect(current_path).to eq(user_path(@user_1))
    
      expect(page).to have_content("Welcome, #{@user_1.name}!")

      visit login_path

      fill_in 'email', with: @user_2.email
      fill_in 'password', with: @user_2.password

      click_on 'Login'

      expect(current_path).to eq(user_path(@user_2))
      expect(current_path).to_not eq(user_path(@user_1))
    
      expect(page).to have_content("Welcome, #{@user_2.name}!")
    end

    it 'has sad path for email not found at login' do
      visit login_path

      fill_in 'email', with: 'WRONG EMAIL'
      fill_in 'password', with: 'WRONG PASSWORD'

      click_on 'Login'

      expect(page).to have_content("Email Not Found")
    end

    it 'has sad path for incorrect password at login' do
      visit login_path

      fill_in 'email', with: @user_1.email
      fill_in 'password', with: 'WRONG PASSWORD'

      click_on 'Login'

      expect(page).to have_content("Password Incorrect")


      fill_in 'email', with: @user_1.email
      fill_in 'password', with: @user_1.password

      click_on 'Login'

      expect(current_path).to eq(user_path(@user_1))
    
      expect(page).to have_content("Welcome, #{@user_1.name}!")
    end
  end
end