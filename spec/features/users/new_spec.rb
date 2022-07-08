require 'rails_helper'
require 'faker'

RSpec.describe 'register new user form' do
  it 'can fill out a form to create a new user', :vcr do
    visit '/register'
    expect(page).to have_content('Register a New User')

    fill_in 'Name', with: 'Itachi Uchiha'
    fill_in 'Email', with: 'itachi.uchiha@gmail.com'
    click_button 'Register'

    expect(page).to have_content("Itachi Uchiha's Dashboard")
  end
end
