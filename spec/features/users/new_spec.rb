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

# User Story #3 - Logging In Happy Path
# As a registered user 
# When I visit the landing page `/`
# I see a link for "Log In"
# When I click on "Log In"
# I'm taken to a Log In page ('/login')
# where I can input my unique email and password.
# When I enter my unique email and correct password 
# I'm taken to my dashboard page

# Notes for User Story #3:
# You will need to create two routes for this user story 
# (one for going to a /login page, and 
# one for actually checking credentials and directing traffic). 
# These routes DO NOT need to be ReSTful right now. 
# We'll talk about how to make them ReSTful tomorrow. 
# For now, you might consider doing something like this:
# GET '/login', to: 'users#login_form'
# login_form will render login_form.html.erb for users 
# to fill in a form with their credentials
# POST '/login', to: 'users#login_user'
# login_user will check if a user exists with 
# the email address that was provided,
#  then check to see if the password, when hashed, 
#  matches the secure password stored in the database, 
#  and then redirects the user based on if credentials are correct.

  it "can let a registered user login" do 
    user = User.create!(name: 'Smudger', email: 'imadog@email.com', password: "steak", password_confirmation: "steak")
    
    visit '/'

    expect(page).to have_link("Log In") 
    click_on ("Log In")
    expect(current_path).to eq("/login")

    fill_in 'Email', with: 'imadog@email.com'
    fill_in 'Password', with: 'steak'
    click_on ('Submit')

    expect(current_path).to eq("/users/#{user.id}")
  end

  it "can tell a user if they're entering the wrong credentials" do 
    user = User.create!(name: 'Smudger', email: 'imadog@email.com', password: "steak", password_confirmation: "steak")
    
    visit '/'

    expect(page).to have_link("Log In") 
    click_on ("Log In")
    expect(current_path).to eq("/login")

    fill_in 'Email', with: 'imadog@email.com'
    fill_in 'Password', with: 'stea'
    click_on ('Submit')

    expect(page).to have_content("Your login information is incorrect. Please try to login again.")
  end

end
