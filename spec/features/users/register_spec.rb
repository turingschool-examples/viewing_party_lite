# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User Registration Page' do
  it 'can create a new user ' do
    visit register_path
    fill_in 'name', with: 'Jamar'
    fill_in 'email', with: 'Jamar@sucks.com'
    fill_in 'password', with: 'test123'
    fill_in 'password_confirmation', with: 'test123'
    click_on 'Create User'
    expect(current_path).to eq(user_path(User.last.id))
  end

  it 'gives an error when not all fields are filled out ' do
    visit register_path
    fill_in 'email', with: 'Jamar@sucks.com'
    fill_in 'password', with: 'test123'
    fill_in 'password_confirmation', with: 'test123'
    click_on 'Create User'
    expect(current_path).to eq(register_path)
    expect(page).to have_content("Name can't be blank")
  end

  it "gives an error when passwords dont match " do
    visit register_path
    fill_in 'name', with: 'Jamar'
    fill_in 'email', with: 'Jamar@sucks.com'
    fill_in 'password', with: 'test123'
    fill_in 'password_confirmation', with: 'test456'
    click_on 'Create User'
    expect(current_path).to eq(register_path)
    expect(page).to have_content("Password confirmation doesn't match Password")
  end

end
