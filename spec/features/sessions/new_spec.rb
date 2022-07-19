# frozen_string_literal: true

require 'rails_helper'

describe 'user login page' do
  before do
    visit '/login'
  end
  it 'has a form to login and once authenticated with a successful login it redirects to the new users show page' do
    User.create!(name: 'Jane', email: 'eleven@upsidedown.com', password: 
        'test123')

    fill_in 'name', with: 'Jane'
    fill_in 'email', with: 'eleven@upsidedown.com'
    fill_in 'password', with: 'test123'
    click_button('Log In')
    user = User.find_by(email: "eleven@upsidedown.com")

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Jane's Dashboard")
  end

  it 'has a form to login and provides an error message if the password/credentials are not correct.' do
    User.create!(name: 'Jane', email: 'eleven@upsidedown.com', password: 
        'test123')

    fill_in 'name', with: 'Jane'
    fill_in 'email', with: 'eleven@upsidedown.com'
    fill_in 'password', with: 'testing123'
    click_button('Log In')
    user = User.find_by(email: "eleven@upsidedown.com")

    expect(current_path).to eq("/login")
    expect(page).to have_content("Invalid Credentials")
  end
end 
