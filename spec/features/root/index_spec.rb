require 'rails_helper'

RSpec.describe 'landing page' do
  before do
    @user_1 = User.create!(name: 'user_1', email: 'test_5@gmail.com', password: "Test")
    @user_2 = User.create!(name: 'user_2', email: 'test_3@gmail.com', password: "Test")
    @user_3 = User.create!(name: 'user_3', email: 'test_2@gmail.com', password: "Test")

    visit root_path
  end

  it 'has a link to redirect to root' do
    link = "Home"

    within '.links' do
      expect(page).to have_link(link)
    end

    click_link "Home"
    expect(page).to have_current_path(root_path)
  end

  it 'has an application title' do
    within '.title' do
      expect(page).to have_content('Viewing Party Lite')
    end
  end

  it 'has a button to create a new user' do
    within '.new-user' do
      click_button 'Register'
      expect(current_path).to eq(register_path)
    end
  end

  it "displays all users' names and emails" do
    visit "/login"
    fill_in(:email, with: @user_1.email)
    fill_in(:password, with: @user_1.password)
    click_on "Log In"
    click_on "Home"

    within '.all-users' do
      expect(page).to have_content(@user_1.name)
      expect(page).to have_content(@user_2.name)
      expect(page).to have_content(@user_3.name)
      expect(page).to have_content(@user_1.email)
      expect(page).to have_content(@user_2.email)
      expect(page).to have_content(@user_3.email)
    end
  end

  it "has a button to log in" do
    expect(page).to have_button("Log In")

    click_button "Log In"

    expect(current_path).to eq("/login")
  end

  it "changes the display" do
    visit "/login"
    fill_in(:email, with: @user_1.email)
    fill_in(:password, with: @user_1.password)
    click_on "Log In"
    click_on "Home"

    expect(page).to have_button("Log Out")
    expect(page).to_not have_button("Log In")
    expect(page).to_not have_button("Register")
  end

  it "does not displays users if not logged in" do
    expect(page).to_not have_content(@user_1.name)
    expect(page).to_not have_content(@user_3.email)
  end

  it "will not let a visitor visit a dashboard" do
    visit "/dashboard"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("You must log in or register to view a dashboard")
  end

  it "can log out" do
    visit "/login"
    fill_in(:email, with: @user_1.email)
    fill_in(:password, with: @user_1.password)
    click_on "Log In"
    click_on "Home"

    expect(page).to have_button("Log Out")

    click_on "Log Out"

    expect(current_path).to eq(root_path)
    expect(page).to_not have_button("Log Out")
    expect(page).to have_button("Log In")
  end
end
