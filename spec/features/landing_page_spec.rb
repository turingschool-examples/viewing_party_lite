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

    expect(current_path).to eq("/new")
  end

  it 'displays all current users' do
    visit '/'

    expect(page).to have_content(@user1.email)
    expect(page).to have_content(@user2.email)
  end

end
