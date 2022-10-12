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
          user4 = create(:user, password_digest:BCrypt::Password.create('IlovecOde2!'))

          expect(current_path).to eq("/users/#{(user4.id) - 1}")
        end

        it "You can see a link to the home page" do
          visit new_user_path
          expect(page).to have_link('Home Page')

          click_on('Home Page')
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
      end

    end
  end
end

