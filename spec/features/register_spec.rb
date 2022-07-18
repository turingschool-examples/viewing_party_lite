require 'rails_helper'

RSpec.describe "User Registration Page", type: :feature do
  before :each do
    user1 = User.create!(name: 'Sai', email: 'SaiLent@overlord.com', password: 'haisall123')
  end

  it 'has a form' do
    visit "/register"
    expect(page).to have_field(:name)
    expect(page).to have_field(:email)
    expect(page).to have_field(:password)
    expect(page).to have_field(:password_confirmation)
    expect(page).to have_button("Register")
  end

  it 'can register a new user' do
    visit "/register"
    last_user = User.all.last

    fill_in :name, with: 'Casey'
    fill_in :email, with: 'EternalPancakes@Geemail.com'
    fill_in :password, with: "test_password"
    fill_in :password_confirmation, with: "test_password"
    click_button("Register")

    expect(page).to have_current_path("/users/#{last_user.id + 1}")
    expect(page).to_not have_content('Please enter a valid name and email address to register.')
  end

  it 'will not register an email that was already used' do
    visit "/register"

    fill_in :name, with: 'Sai Again'
    fill_in :email, with: 'SaiLent@overlord.com'
    click_button("Register")
    
    expect(page).to have_current_path('/register')
    expect(page).to have_content("Email has already been taken")
  end

  it 'will not register a user if matching passwords are not entered' do
    visit "/register"

    fill_in :name, with: 'Parker'
    fill_in :email, with: 'iheartbeards@aol.com'
    fill_in :password, with: 'parkersbeard'
    fill_in :password_confirmation, with: 'barkerspeard'
    click_button("Register")

    expect(page).to have_current_path('/register')
    expect(page).to have_content("Password confirmation doesn't match Password")
  end
end
