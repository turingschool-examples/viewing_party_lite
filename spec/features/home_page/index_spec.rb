require 'rails_helper'

RSpec.describe 'home page index' do
  before :each do
    @user1 = User.create!(name: 'tom', email: 'tom.gmail.com')
    @user2 = User.create!(name: 'wes', email: 'wes.gmail.com')

    visit root_path
  end

  it 'shows the application title' do
    expect(page).to have_content('Viewing Party Lite')
  end

  it 'has a button to create a new user' do
    expect(page).to have_button('Create New User')
  end

  it 'lists all users and whitch links to the users dashboard' do
    expect(page).to have_link("tom's dashboard")
    expect(page).to have_link("wes's dashboard")
  end

  it 'has a link to the home page' do
    expect(page).to have_link("Home")
  end

end
