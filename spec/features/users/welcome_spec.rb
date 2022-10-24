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

      it 'I can see a list of existing users' do
        user1 = create(:user)
        user2 = create(:user)
        user3 = create(:user)
        user4 = create(:user)

        visit root_path
        within('#all_users') do
          expect(page).to have_content("#{user1.email}")
          expect(page).to have_content("#{user2.email}")
          expect(page).to have_content("#{user3.email}")
          expect(page).to have_content("#{user4.email}")
        end
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

      xit "On the login page When I enter my unique email and correct password I'm taken to my dashboard page" do
        visit login_path

        user1 = User.create!(name: "Alaina", email:"alaina@fake.com", password_digest: "Il0vePeppers")

        fill_in(:email, with: "alaina@fake.com")
        fill_in(:password, with: "Il0vePeppers")
        click_button("Log In")
        user4 = create(:user, password_digest:BCrypt::Password.create('IlovecOde2!'))

        expect(current_path).to eq("/users/#{(user4.id) - 1}") #could we change this to be user1.id?
      end
    end
  end
end
