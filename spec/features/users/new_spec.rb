require 'rails_helper'

RSpec.describe 'user registration page', type: :feature do
  describe 'As a visitor' do
    describe 'When I visit the /register page' do

      it 'I can see a form to register including name, email, password & register button' do
        visit new_user_path
        expect(page).to have_content('Name')
        expect(page).to have_content('Email')
        expect(page).to have_content('Password')
        expect(page).to have_button('Create User')
      end

      describe 'happy path' do
        it "Once the user registers they should be taken to a dashboard page '/users/:id', where :id is the id for the user that was just created." do
          visit new_user_path 
          fill_in(:name, with: "Peter Piper")
          fill_in(:email, with: "Peter.Piper@peppers.com")
          fill_in(:password, with: "IlovePeppers")
          fill_in(:password_confirmation, with: "IlovePeppers")

          click_on('Create User')
          expect(current_path).to eq(dashboard_path)
        end

        it "You can see a link to the home page" do
          visit new_user_path
          expect(page).to have_link('Home')

          click_on('Home')
          expect(current_path).to eq(root_path)
        end
      end

      describe 'sad path' do
        it "If the user fails to fill in valid information they see an error message & are redirected to the current page to fill in the form again" do
          visit new_user_path

          #missing name fill in
          fill_in(:email, with: "Peter.Piper@peppers.com")
          fill_in(:password, with: "IlovePeppers")
          fill_in(:password_confirmation, with: "IlovePeppers")

          click_on('Create User')
          expect(current_path).to eq('/users')
          expect(page).to have_content("Name can't be blank")
        end

        it "If the user fails to password match they see an error message & are redirected to the current page to fill in the form again" do
          visit new_user_path

          fill_in(:name, with: "Peter Piper")
          fill_in(:email, with: "Peter.Piper@peppers.com")
          fill_in(:password, with: "IlovePeppers")
          fill_in(:password_confirmation, with: "IlovePeppers!!!!!")

          click_on('Create User')
          expect(current_path).to eq('/users')
          expect(page).to have_content("Error: Password doesn't match.")
        end

        it "If the user tried to use an email address that's already been taken they are not allowed to sign up." do
          visit new_user_path

          fill_in(:name, with: "Peter Piper")
          fill_in(:email, with: "Peter.Piper@peppers.com")
          fill_in(:password, with: "IlovePeppers")
          fill_in(:password_confirmation, with: "IlovePeppers")

          click_on('Create User')
          click_on('Home')
          click_on('New User')

          fill_in(:name, with: "Megan Piper")
          fill_in(:email, with: "Peter.Piper@peppers.com")
          fill_in(:password, with: "IlovePeppers!")
          fill_in(:password_confirmation, with: "IlovePeppers!")
          click_on('Create User')

          expect(page).to have_content("Email has already been taken")
        end
      end

    end
  end
end

