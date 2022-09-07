require 'rails_helper'

RSpec.describe 'User Registration Page' do
  it 'has form to register new user' do
    visit '/register'

    name = "Smudger"
    email = "imadog@email.com"
    password = "steak"
    password_confirmation = "steak"

    fill_in :name, with: name
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation

    click_on 'Register'

    expect(current_path).to eq("/users/#{User.all.last.id}")
  end

  it "registers a new user" do
    visit '/register'

    name = "Smudger"
    email = "imadog@email.com"
    password = "steak"
    password_confirmation = "steak"

    fill_in :name, with: name
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation

    click_on "Register"

    expect(current_path).to eq(("/users/#{User.all.last.id}"))
  end

# As a visitor 
# When I visit `/register`
# and I fail to fill in my name, unique email, OR matching passwords,
# I'm taken back to the `/register` page
# and a flash message pops up, telling me what went wrong
# Steps for User Story #2:
# Add a Sad Path Test for creating a user
# You're going to need to update the logic in your controller action 
# to check if the password AND password_confirmation both came through, and match.
  it "has to have all fields filled to register a user" do
    visit '/register'

    name = ""
    email = "imadog@email.com"
    password = "steak"
    password_confirmation = "stea"

    fill_in :name, with: name
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation

    click_on "Register"

    expect(page).to have_content("Name can't be blank and Password confirmation doesn't match Password")
  end

end
