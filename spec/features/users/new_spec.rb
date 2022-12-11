require 'rails_helper'

RSpec.describe 'New User Registration' do
  before(:each) do
    @email = Faker::Internet.email

    visit '/register'
  end

  describe 'registration form' do
    it 'can register a new user' do
      username = "Foo Person"
      email = "foo@email.com"
      password = "test"

      fill_in "Name",	with: username
      fill_in "email",	with: email
      fill_in "password", with: password
      click_on 'Register'
      new_user = User.last
      expect(current_path).to eq(user_path(new_user))

      expect(page).to have_content("Welcome #{username}!")
    end

    describe 'happy path' do
      it 'creates a new user and redirects to the show page for that user when the form is successfully submitted' do
        fill_in 'Name', with: 'John Doe'
        fill_in 'Email', with: @email
        click_button 'Register'

        new_user = User.find_by(name: 'John Doe')
        expect(page).to have_current_path(user_path(new_user))
        expect(new_user.email).to eq(@email)
      end
    end

    describe 'sad paths' do
      it 'does not create a new user if the submitted email is identical to an existing user email' do
        User.create!(name: 'John Doe', email: @email)
        fill_in 'Name', with: 'Imposter John'
        fill_in 'Email', with: @email
        click_button 'Register'

        expect(page).to have_current_path('/register')
        expect(User.exists?(name: 'Imposter John', email: @email)).to eq(false)
      end
    end
  end
end
