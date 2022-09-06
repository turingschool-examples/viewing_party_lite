require 'rails_helper'

RSpec.describe 'Register Page' do
  it "has a form to fill out the name and email" do
    ben = User.create!(name: "Ben", email: "benjsdev@gmail.com", password: 'password123', password_confirmation: 'password123')
    brian = User.create!(name: "Brian", email: "bshearsdev@gmail.com", password: 'password123', password_confirmation: 'password123')
    drew = User.create!(name: "Drew", email: "dmacdev@gmail.com", password: 'password123', password_confirmation: 'password123')

    visit "/register"

    fill_in "Name", with: "Brad"
    fill_in "Email", with: "bhopkodev@gmail.com"

    click_on "Submit"

    brad = User.last

    expect(current_path).to eq("/users/#{brad.id}")

    visit root_path

    expect(page).to have_content("bhopkodev@gmail.com")
  end

  it 'wont let you create a new user without filling out the name field' do 
    
    visit "/register"

    fill_in "Name", with: ""
    fill_in "Email", with: "bhopkodev@gmail.com"
    fill_in "Password", with: "password123"
    fill_in "Password Confirmation", with: "password123"
    
    click_on 'Submit'
    
    expect(current_path).to eq("/register")

  end 

   it 'wont let you create a new user without filling out the email field' do 
    
    visit "/register"

    fill_in "Name", with: "Brad"
    fill_in "Email", with: ""
    fill_in "Password", with: "password123"
    fill_in "Password Confirmation", with: "password123"
    
    click_on 'Submit'
    
    expect(current_path).to eq("/register")

  end 

   it 'wont let you create a new user without filling out the password field' do 
    
    visit "/register"

    fill_in "Name", with: "Brad"
    fill_in "Email", with: "bhopkodev@gmail.com"
    fill_in "Password", with: ""
    fill_in "Password Confirmation", with: "password123"
    
    click_on 'Submit'
    
    expect(current_path).to eq("/register")

  end 
end
