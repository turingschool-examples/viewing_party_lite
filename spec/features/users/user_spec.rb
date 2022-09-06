require 'rails_helper'
#new user register
RSpec.describe "user registration page" do 
  it "has a form to register" do 

    visit "/register"

    expect(page).to have_field(:name)
    expect(page).to have_field(:email)
    expect(page).to have_field(:password)
    expect(page).to have_field(:password_conf)
    expect(page).to have_button("Register")
  end

  it "should take the user to their dashboard page after they register" do 

    visit "/register"

    fill_in :name, with: "Sam Smith"
    fill_in :email, with: "sam@smith.com"
    fill_in :password, with: "123test"
    click_on "Register"

    test = User.first 

    expect(current_path).to eq("/users/#{test.id}")
    expect(test.email).to eq("sam@smith.com")
  end
  
  #auth_challenge starts here:
  it "should require name, email, and password to register AND user email must be unique" do 
    visit "/register"

    fill_in :name, with: "Sam Smith"
    fill_in :email, with: "sam@smith.com"
    fill_in :password, with: "test123"
    email = "sam@smith.com"
    
    click_on "Register"

    test = User.first 
    # save_and_open_page
    expect(current_path).to eq("/users/#{test.id}")
    expect(page).to have_content("Welcome, #{email}!")

    visit "/register"
    fill_in :name, with: "Sasha Fierce"
    fill_in :email, with: "sam@smith.com"
    fill_in :password, with: "test123"

    click_on "Register"

    expect(page).to have_content("Email has already been taken")
    expect(current_path).to eq("/register") 

    visit "/register"
    fill_in :name, with: "Beyonce"
    fill_in :email, with: "beyonce@beyonce.com"

    click_on "Register"

    expect(page).to have_content("Password can't be blank")

    visit "/register"
    fill_in :name, with: "Beyonce"
    fill_in :password, with: "124test"

    click_on "Register"

    expect(page).to have_content("Email can't be blank")
  end

  it "can log in with credentials" do 
    user = User.create(name: "Joe Biden", email: "joe@biden.com", password: "testing")

    visit "/"

    click_on "I already have an account"

    expect(current_path).to eq("/login")

    visit "/login"
    fill_in :name, with: "Joe Biden"
    fill_in :email, with: "joe@biden.com"
    fill_in :password, with: "testing"
    fill_in :password_conf, with: "testing"

    click_on "Log In"

    expect(current_path).to eq("/users/#{user.id}")
    expect(page).to have_content("Welcome, #{user.email}!")
  end


  it "cannot log in with bad credentials" do 
    user = User.create(name: "Joe Biden", email: "joe@biden.com", password: "testing")

    visit "/"

    click_on "I already have an account"

    expect(current_path).to eq("/login")
    visit "/login"

    fill_in :name, with: user.name 
    fill_in :email, with: user.email 
    fill_in :password, with: "wrongpassword"

    click_on "Log In"

    expect(current_path).to eq("/login")
    expect(page).to have_content("Sorry, your credentials are bad")
  end
end


