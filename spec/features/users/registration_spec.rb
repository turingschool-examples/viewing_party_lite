# AUTHENTICATION USER STORY 
# As a visitor
# When I visit '/'
# and I can click a link that says "Sign Up to Be a User"
# and I can enter registration details in a form
# and submit that form
# Then I should see a welcome message with my username
# and my user details have been saved in the database.


require 'rails_helper'

RSpec.describe "User registration form" do
  it "creates new user" do
    visit root_path

    click_on "Register as a User"

    expect(current_path).to eq(new_user_path)

    username = "barbiedreamhouse13"
    password = "test"

    # have to change the field names when use a model form
    fill_in :user_name, with: "Barbie"
    fill_in :user_email, with: "barbiegal@gmail.com"
    fill_in :user_username, with: username
    fill_in :user_password, with: password
    fill_in :user_password_confirmation, with: password

    click_on "Create User"

    expect(page).to have_content("Welcome, #{username}!")
  end

  it 'creates an error if the password and password confirmation do not match' do
    visit root_path

    click_on "Register as a User"

    expect(current_path).to eq(new_user_path)

    username = "barbiedreamhouse13"
    password = "test"

    # have to change the field names when use a model form
    fill_in :user_name, with: "Barbie"
    fill_in :user_email, with: "barbiegal@gmail.com"
    fill_in :user_username, with: username
    fill_in :user_password, with: password
    fill_in :user_password_confirmation, with: "tessst"

    click_on "Create User"

    expect(page).to have_content("Password confirmation doesn't match Password")
  end
end
