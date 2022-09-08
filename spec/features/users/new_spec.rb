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

    expect(current_path).to eq('/dashboard')
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

    expect(current_path).to eq('/dashboard')
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

  it "can let a registered user login" do 
    user = User.create!(name: 'Smudger', email: 'imadog@email.com', password: "steak", password_confirmation: "steak")
    
    visit root_path

    expect(page).to have_link("Log In") 
    click_on ("Log In")
    expect(current_path).to eq("/login")

    fill_in 'Email', with: 'imadog@email.com'
    fill_in 'Password', with: 'steak'
    click_on ('Submit')

    expect(current_path).to eq('/dashboard')
  end

  it "can tell a user if they're entering the wrong credentials" do 
    user = User.create!(name: 'Smudger', email: 'imadog@email.com', password: "steak", password_confirmation: "steak")
    
    visit root_path

    expect(page).to have_link("Log In") 
    click_on ("Log In")
    expect(current_path).to eq("/login")

    fill_in 'Email', with: 'imadog@email.com'
    fill_in 'Password', with: 'stea'
    click_on ('Submit')

    expect(page).to have_content("Your login information is incorrect. Please try to login again.")
  end

  it "can log out a user" do 
    user = User.create!(name: 'Smudger', email: 'imadog@email.com', password: "steak", password_confirmation: "steak")

    visit '/login' 

    fill_in 'Email', with: 'imadog@email.com'
    fill_in 'Password', with: 'steak'
    click_on ('Submit')

    visit root_path

    expect(page).to_not have_link("Log In")
    expect(page).to_not have_link("Create New User")

    expect(page).to have_link("Log Out") 
    click_on ("Log Out")
    expect(current_path).to eq("/")
    expect(page).to have_link("Log In")
  end
end
