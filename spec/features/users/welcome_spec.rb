require 'rails_helper'

RSpec.describe 'application welcome page', type: :feature do
  describe 'As a user' do
    describe 'When I visit the root path/welcome page' do

      it 'I can see the application title, a button to create a new user, & a link to go back to the landing page' do

        visit root_path
        expect(page).to have_content('Viewing Party Lite')
        expect(page).to have_button('New User')
        expect(page).to have_link('Home')

        click_on('Home')
        expect(current_path).to eq(root_path)
      end

      it 'The New User button should lead to the registration page' do
        visit root_path

        click_on('New User')
        expect(current_path).to eq('/register')
      end

      it 'I see a link to login & can click that link and be taken to a login page' do
        visit root_path

        expect(page).to have_button("Login")
        click_button("Login")
        expect(current_path).to eq(login_path)
        expect(page).to have_content("Email")
        expect(page).to have_content("Password")
        expect(page).to have_content("Re-Enter Password")
      end

      it "On the login page When I enter my unique email and correct password I'm taken to my dashboard page" do
        visit login_path

        user1 = User.create!(name: "Alaina", email:"alaina@fake.com", password: "Il0vePeppers", password_confirmation: "Il0vePeppers" )

        fill_in(:email, with: "alaina@fake.com")
        fill_in("Password", with: "Il0vePeppers")
        fill_in(:password_confirmation, with: "Il0vePeppers")
        click_button("Login")

        expect(current_path).to eq("/users/#{user1.id}")
      end
    end
  end
end
