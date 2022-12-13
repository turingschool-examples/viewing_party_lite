require 'rails_helper'

RSpec.describe 'root path; application landing page' do
  before :each do
    @user_1 = User.create!(name: 'Jim', email: 'jim.halpert@gmail.com', username: 'greatsalesman', password: 'pass')
    @user_2 = User.create!(name: 'Pam', email: 'pam.halpert@gmail.com', username: 'receptionist', password: '123pass')
  end
  
  it 'has the title of the application and existing users' do
    visit root_path

    expect(page).to have_content("Viewing Party Lite")
    expect(page).to have_content(@user_1.name)
    expect(page).to have_content(@user_2.name)
  end

  it 'has a link to the user dashboard' do
    visit root_path

    expect(page).to have_link(@user_1.name)
    expect(page).to have_link(@user_2.name)

    click_on @user_1.name

    expect(current_path).to eq("/users/#{@user_1.id}")
  end

  it 'has a button to create a new user' do
    visit root_path

    expect(page).to have_button("Create New User")
    
    click_on "Create New User"

    expect(current_path).to eq(new_register_path)
  end

  it 'has a link to visit the landing page' do
    visit root_path

    expect(page).to have_link("Home")

    click_on "Home"

    expect(current_path).to eq('/')
  end

  it 'has a link to log in' do
    visit root_path

    expect(page).to have_link("Log In")
    click_on "Log In"

    expect(current_path).to eq("/login")
  end
end