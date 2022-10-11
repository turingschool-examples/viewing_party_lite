require 'rails_helper'

RSpec.describe 'Landing Page' do
  before :each do
    @user1 = User.create(name: "Jake", email: "imjakekim@gmail.com")
    @user2 = User.create(name: "Riley", email: "rileybmccullough@gmail.com")
  end

  it 'routes request to correct page' do
    visit '/'

    expect(page).to have_content("Viewing Party Lite")
  end

  it 'has button to create user' do
    visit '/'
    click_button "Create a New User"

    expect(current_path).to eq("/register")
  end

  it 'displays all current users' do
    visit '/'
# save_and_open_page
    expect(page).to have_content(@user1.email)
    expect(page).to have_content(@user2.email)
  end

  it 'can use link to view user dashboard page' do
    visit '/'
    click_on "imjakekim@gmail.com's Dashboard"

    expect(current_path).to eq("/users/#{@user1.id}")
  end

  it 'has a button to return you back to the homepage' do
    visit '/'
    click_on 'Return to the Homepage'

    expect(current_path).to eq('/')
  end

end
