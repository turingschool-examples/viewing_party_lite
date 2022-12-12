require 'rails_helper'

RSpec.describe 'register page' do
  before :each do
    @user_1 = User.create!(name: 'Jim', email: 'jim.halpert@gmail.com')
    @user_2 = User.create!(name: 'Pam', email: 'pam.halpert@gmail.com')
  end

  it "should have a form to register user" do
    visit new_register_path
    
    expect(page).to have_field(:name)
    expect(page).to have_field(:email)
    
    fill_in "name", with: "Dwight Schrute"
    fill_in "email", with: "dwight.schrute@gmail.com"
    click_button "Register"
    new_user = User.last.id
    expect(current_path).to eq(user_path(new_user))
  end

  it 'has an error message if email is already taken' do
    visit new_register_path

    fill_in :name, with: "#{@user_1.name}"
    fill_in :email, with: "#{@user_1.email}"
    click_button "Register"

    expect(page).to have_content("Email has already been taken")
  end

  it 'has an error message if the name is blank' do
    visit new_register_path

    fill_in :name, with: ""
    fill_in :email, with: "example@email.com"
    click_button "Register"

    expect(page).to have_content("Name can't be blank")
  end

  it 'has an error message if the email is blank' do
    visit new_register_path

    fill_in :name, with: "Ryan"
    fill_in :email, with: ""
    click_button "Register"

    expect(page).to have_content("Email can't be blank")
  end

  it 'has an error for name and email if neither are filled in' do
    visit new_register_path

    fill_in :name, with: ""
    fill_in :email, with: ""
    click_button "Register"

    expect(page).to have_content("Email can't be blank")
    expect(page).to have_content("Name can't be blank")
  end

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
end
