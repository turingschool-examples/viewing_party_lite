require 'rails_helper'

RSpec.describe "new user page", type: :feature do

  it 'has a form to register a new user with name and email, and redirects to dashboard of newly created user if successful' do

    visit "/register"

    fill_in "First Name", with: "Jordan"
    fill_in "Last Name", with: "Peele"
    fill_in "Email", with: "jordan-fake@test.com"
    fill_in "Password", with: "testpass"
    fill_in "Confirm Password", with: "testpass"

    click_on "Create New User"

    expect(current_path).to eq("/users/#{User.find_by(email: "jordan-fake@test.com").id}")

    expect(page).to have_content("User jordan-fake@test.com successfully created!")

  end

  it 'prompts user to try again if first name is left blank' do
    visit "/register"

    fill_in "Last Name", with: "Peele"
    fill_in "Email", with: "jordan-fake@test.com"
    fill_in "Password", with: "testpass"
    fill_in "Confirm Password", with: "testpass"
    click_on "Create New User"

    expect(current_path).to eq("/register")

    expect(page).to have_content("Error: Please complete all fields")
  end

  it 'prompts user to try again if last name is left blank' do
    visit "/register"

    fill_in "First Name", with: "Jordan"
    fill_in "Email", with: "jordan-fake@test.com"
    fill_in "Password", with: "testpass"
    fill_in "Confirm Password", with: "testpass"
    click_on "Create New User"

    expect(current_path).to eq("/register")

    expect(page).to have_content("Error: Please complete all fields")
  end

  it 'prompts user to try again if email already exists' do
    user1 = User.create!(first_name: "Jordan", last_name: "Peele", email: "jordan-fake@test.com", password: "test123", password_confirmation: "test123")

    visit "/register"

    fill_in "First Name", with: "Jordan"
    fill_in "Last Name", with: "Peele"
    fill_in "Email", with: "jordan-fake@test.com"
    fill_in "Password", with: "testpass"
    fill_in "Confirm Password", with: "testpass"
    click_on "Create New User"

    expect(current_path).to eq("/register")

    expect(page).to have_content("Error: Email address is taken")
  end

  it 'is case insensitive in checking email existence' do
    user1 = User.create!(first_name: "Jordan", last_name: "Peele", email: "jordan-fake@test.com", password: "test123", password_confirmation: "test123")

    visit "/register"

    fill_in "First Name", with: "Jordan"
    fill_in "Last Name", with: "Peele"
    fill_in "Email", with: "jOrDAn-FaKe@tEST.com"
    fill_in "Password", with: "testpass"
    fill_in "Confirm Password", with: "testpass"
    click_on "Create New User"

    expect(current_path).to eq("/register")

    expect(page).to have_content("Error: Email address is taken")
  end

  it 'rejects if email does not contain an @ sign' do
    visit "/register"

    fill_in "First Name", with: "Jordan"
    fill_in "Last Name", with: "Peele"
    fill_in "Email", with: "jOrDAn-FaKetEST.com"
    fill_in "Password", with: "testpass"
    fill_in "Confirm Password", with: "testpass"
    click_on "Create New User"

    expect(current_path).to eq("/register")

    expect(page).to have_content("Error: Invalid email address")
  end

  it 'has fillable password and password confirmation fields' do
    visit '/register'

    email = "jOrDAn-FaKetEST@test.com"

    fill_in "First Name", with: "Jordan"
    fill_in "Last Name", with: "Peele"
    fill_in "Email", with: email

    fill_in "Password", with: "testpass"
    fill_in "Confirm Password", with: "testpass"

    click_on "Create New User"

    expect(page).to have_content("User #{email} successfully created!")

    user_id = User.find_by(email: email).id

    expect(current_path).to eq("/users/#{user_id}")
  end

  it 'prompts user to try again if password and password_confirmation fields do not match' do
    visit '/register'

    email = "jOrDAn-FaKetEST@test.com"

    fill_in "First Name", with: "Jordan"
    fill_in "Last Name", with: "Peele"
    fill_in "Email", with: email

    fill_in "Password", with: "testpass"
    fill_in "Confirm Password", with: "testpassWRONG"

    click_on "Create New User"

    expect(current_path).to eq('/register')

    expect(page).to have_content("Password and confirmation did not match")
  end
end

# As a visitor 
# When I visit `/register`
# I see a form to fill in my name, email, password, and password confirmation.
# When I fill in that form with my name, email, and matching passwords,
# I'm taken to my dashboard page `/users/:id`