require 'rails_helper'

RSpec.describe 'New User Registration' do
  before(:each) do
    @email = Faker::Internet.email

    visit '/register'
  end

  describe 'form' do
    
    it 'can register a new user' do
      username = "Foo Person"
      email = "foo@email.com"
      password = "test"

      fill_in "Name",	with: username
      fill_in "email",	with: email
      fill_in "password", with: password
      fill_in "password confirmation", with: password
      first(:button, 'Register').click

      expect(page).to have_content("Welcome #{username}!")
    end

    describe 'happy path' do
      it 'creates a new user and redirects to the root page for that user when the form is successfully submitted' do
        fill_in 'Name', with: 'John Doe'
        fill_in 'Email', with: @email
        fill_in "password",	with: "test"
        click_button 'Register'

        new_user = User.find_by(name: 'John Doe')
        expect(page).to have_current_path(root_path)
        expect(new_user.email).to eq(@email)
      end
    end

    describe 'sad paths' do
      it 'does not create a new user if the submitted email is identical to an existing user email' do
        create(:user, name: 'John Doe', email: @email)
        fill_in 'Name', with: 'Imposter John'
        fill_in 'Email', with: @email
        click_button 'Register'

        expect(page).to have_current_path('/register')
        expect(User.exists?(name: 'Imposter John', email: @email)).to eq(false)
      end
    end

    context "for an existing user" do
      describe 'happy path' do
        it 'has a link for existing accounts' do
          user = create(:user, password: 'test')
          last_user = User.last

          expect(last_user.name).to eq(user.name)
          expect(last_user.email).to eq(user.email)

          expect(page).to have_content('I already have an account')
          click_on 'I already have an account'
          expect(current_path).to eq(login_path)

          fill_in "Name",	with: last_user.name
          fill_in "email",	with: last_user.email
          fill_in "password",	with: user.password
          fill_in "confirm password",	with: user.password

          click_on "log in"

          expect(current_path).to eq(root_path)

          expect(page).to have_content("Welcome #{last_user.name}!")
        end
      end


    end
  end
end
