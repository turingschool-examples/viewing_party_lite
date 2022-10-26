require 'rails_helper'

RSpec.describe 'login an existing user page', type: :feature do
  describe 'As an existing user' do
    describe 'When I visit the login page' do
      describe 'happy path' do
        it "On the login page When I enter my unique email and correct password I'm taken to my dashboard page" do
          visit login_path

          user1 = User.create!(name: "Alaina", email:"alaina@fake.com", password: "Il0vePeppers", password_confirmation: "Il0vePeppers" )

          fill_in(:email, with: "alaina@fake.com")
          fill_in("Password", with: "Il0vePeppers")
          click_button("Login")

          expect(current_path).to eq(dashboard_path)
        end
      end

      describe 'sad path' do
        it "If I am not a registered user and I try to access a page I don't have rights to see I recieve an error message" do
          visit dashboard_path

          expect(current_path).to eq(login_path)
          expect(page).to have_content("Bad credentials, try again.")
        end


        it "If I am not a registered user I recieve an error message" do
          visit login_path

          user1 = User.create!(name: "Alaina", email:"alaina@fake.com", password: "Il0vePeppers", password_confirmation: "Il0vePeppers" )

          fill_in(:email, with: "person@fake.com")
          fill_in("Password", with: "Il0vePeppers")
          click_button("Login")

          expect(current_path).to eq(login_path)
          expect(page).to have_content("You are not a registered user.")
        end

        it "If I a enter mismatches passwords I recieve an error message" do
          user1 = User.create!(name: "Alaina", email:"alaina@fake.com", password: "Il0vePeppers", password_confirmation: "Il0vePeppers" )

          visit login_path
          fill_in(:email, with: "alaina@fake.com")
          fill_in(:password, with: "Idontl0vePeppers")
          click_button("Login")

          expect(current_path).to eq(login_path)
          expect(page).to have_content("Your passwords don't match our records")
        end
      end
    end
  end
end