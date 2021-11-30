require 'rails_helper'

RSpec.describe 'New User Page' do
  it 'creates a new user' do
    visit new_user_path

    fill_in :name, with: 'Test Name'
    fill_in :email, with: 'test@example.com'

    click_button

    expect(page).to have_content("Test Name's Dashboard")
  end

  it 'fails when information is missing' do
    visit new_user_path

    click_button

    expect(current_path).to eq new_user_path

    expect(page).to have_content("Could not create user")
  end

  it 'fails when emails are repeated' do
    visit new_user_path

    fill_in :name, with: 'Test Name'
    fill_in :email, with: 'test@example.com'

    click_button

    visit new_user_path

    fill_in :name, with: 'Test Name 2'
    fill_in :email, with: 'test@example.com'

    click_button

    expect(current_path).to eq new_user_path

    expect(page).to have_content("Could not create user")
  end
end