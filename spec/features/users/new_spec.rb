require 'rails_helper'

RSpec.describe 'The User registration' do
  describe 'As a User' do
    describe 'When I visit the User Registration Page' do
      before(:each) do
        @user1 = User.create!(name: 'Mary', email: 'mary@gmail.com')
        @user2 = User.create!(name: 'Larry', email: 'larry@hotmail.com')
        @user3 = User.create!(name: 'Sherri', email: 'sherri@aol.com')
      end
      it 'I see a link to create a new user' do
        visit root_path
        click_button('Create User')
        expect(current_path).to eq(register_path)

        fill_in 'Name', with: 'Martin'
        fill_in 'Email', with: 'martin@gmail.com'
        click_on 'Create Account'

        expect(page).to have_content("Martin")
        expect(page).to_not have_content("Larry")
        expect(page).to_not have_content("Mary")
        expect(page).to_not have_content("Sherri")
      end

      it 'I see a form to fill in my name, email, password, and password confirmation' do
        visit register_path

        expect(page).to have_field(:name)
        expect(page).to have_field(:email)
        expect(page).to have_field(:password)
        expect(page).to have_field(:password_confirmation)
      end

      it 'I fill in the form with valid information and taken to my dashboard page' do
        visit register_path

        fill_in 'Name', with: "Gabe"
        fill_in 'Email', with: "gabe@example.com"
        fill_in 'Password' with: "Test123"
        fill_in 'Password Confirmation' with: "Test123"

        click_on 'Create Account'

        new_user = User.last

        expect(current_path).to eq(user_path(new_user))
      end

      it "checks for unique email address" do
        visit root_path

        click_button('Create User')

        fill_in 'Name', with: "Mary"
        fill_in 'Email', with: "Mary@gmail.com"
        click_on 'Create Account'

        expect(current_path).to eq(register_path)
        expect(page).to have_content("Error: Email already linked with an account")
      end

      it ''
    end
  end
end
