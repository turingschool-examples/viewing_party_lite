require 'rails_helper'

RSpec.describe 'landing page', type: :feature do
  it 'has a landing page with title of application' do
    visit '/'
    expect(page).to have_content('Viewing Party Lite')
  end

  it 'has a button to create a new user' do
    visit '/'
    click_on 'Create New User'
    expect(current_path).to eq('/register')
  end

  it 'has a list of existing users by email' do
    @mary = User.create!(name: 'Mary', email: 'newbie_coder24@gmail.com')
    @sunny = User.create!(name: 'Sunny', email: 'newemail@gmail.com')
    @mackinley = User.create!(name: 'MacKinley', email: 'mrmansemail@gmail.com')
    visit '/'

    within('#existing_users') do
      expect(page).to have_content("newbie_coder24@gmail.com's Dashboard")
      expect(page).to have_content("newemail@gmail.com's Dashboard")

      click_on "newbie_coder24@gmail.com's Dashboard"
      expect(current_path).to eq("/users/#{@mary.id}")
    end
  end

  it 'has a link to return to landing page' do
    visit '/'

    click_link 'Home'
    expect(current_path).to eq('/')
  end
end
