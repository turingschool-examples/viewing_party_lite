require 'rails_helper'

RSpec.describe 'Register Page' do
  it "has a form to fill out the name and email" do
    ben = User.create!(name: "Ben", email: "benjsdev@gmail.com", password: '123456', password_confirmation: '123456')
    brian = User.create!(name: "Brian", email: "bshearsdev@gmail.com", password: '123456', password_confirmation: '123456')
    drew = User.create!(name: "Drew", email: "dmacdev@gmail.com", password: '123456', password_confirmation: '123456')

    visit "/register"

    fill_in "Name", with: "Brad"
    fill_in "Email", with: "bhopkodev@gmail.com"
    fill_in "Password", with: 'password123'
    fill_in "Confirm Your Password", with: 'password123'

    click_on "Submit"

    brad = User.last

    expect(current_path).to eq("/users/#{brad.id}")

    visit root_path

    expect(page).to have_content("bhopkodev@gmail.com")
  end

  it "it doesn't create the user if the password and password confirmation aren't filled out" do
    ben = User.create!(name: "Ben", email: "benjsdev@gmail.com", password: '123456', password_confirmation: '123456')
    brian = User.create!(name: "Brian", email: "bshearsdev@gmail.com", password: '123456', password_confirmation: '123456')
    drew = User.create!(name: "Drew", email: "dmacdev@gmail.com", password: '123456', password_confirmation: '123456')

    visit "/register"

    fill_in "Name", with: "Brad"
    fill_in "Email", with: "bhopkodev@gmail.com"
    fill_in "Password", with: ''
    fill_in "Confirm Your Password", with: ''

    click_on "Submit"

    expect(current_path).to eq("/register")
  end

  it 'cannot create a new user if an email is not input' do
    visit "/register"

    fill_in "Name", with: "Ben"
    fill_in 'Password', with: "password123"
    fill_in 'Confirm Your Password', with: "password123"
    click_button("Submit")
    expect(page).to have_content("#{["Email can't be blank"]}")
    expect(current_path).to eq("/register")

    fill_in "Name", with: "Ben"
    fill_in 'Email', with: "ben123@gmail.com"
    fill_in 'Password', with: "password123"
    fill_in 'Confirm Your Password', with: "password123"
    click_button("Submit")
    user = User.last

    expect(current_path).to eq("/users/#{user.id}")
  end

  it 'cannot create a new user if a password and password confirmation do not match' do
    visit "/register"

    fill_in 'Name', with: "Ben"
    fill_in 'Email', with: "ben123@gmail.com"
    fill_in 'Password', with: "password123"
    fill_in 'Confirm Your Password', with: "password124"
    click_button("Submit")
    expect(page).to have_content("#{["Password confirmation doesn't match Password"]}")
    expect(current_path).to eq("/register")

    fill_in 'Name', with: "Ben"
    fill_in 'Email', with: "ben123@gmail.com"
    fill_in 'Password', with: "password123"
    fill_in 'Confirm Your Password', with: "password123"
    click_button("Submit")
    user = User.last

    expect(current_path).to eq("/users/#{user.id}")
  end

  it 'cannot create a new user without a password and password confirmation' do
    visit "/register"

    fill_in 'Name', with: "Ben"
    fill_in 'Email', with: "ben123@gmail.com"
    click_button("Submit")
    expect(page).to have_content("#{"Password can't be blank"}")
    expect(page).to have_content("#{"Password digest can't be blank"}")
    expect(current_path).to eq("/register")

    fill_in 'Name', with: "Ben"
    fill_in 'Email', with: "ben123@gmail.com"
    fill_in 'Password', with: "password123"
    fill_in 'Confirm Your Password', with: "password123"
    click_button("Submit")
    user = User.last

    expect(current_path).to eq("/users/#{user.id}")
  end
end
