# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'new user registration page', type: :feature do
  before :each do 
    @user = User.create!(name: 'Bob', email: 'bob@turing.edu', password: 'test123')
    visit register_path
  end 
  
  it 'has a form to create a new user then sends user to show page' do
    fill_in :name, with: 'Sally'
    fill_in :email, with: 'sally@turing.com'
    fill_in :password, with: 'test123'
    fill_in :password_confirmation, with: 'test123'

    click_button 'Register New User'

    expect(current_path).to eq(user_path(User.last.id))
  end

  it 'has a unique email' do 
    fill_in :name, with: 'Sarah'
    fill_in :email, with: 'bob@turing.edu'
    fill_in :password, with: 'test123'
    fill_in :password_confirmation, with: 'test123'
    click_button 'Register New User'

    expect(page).to have_current_path(register_path)
    expect(page).to have_content("Email or password are invalid")
  end 

  it 'has a unique password' do 
    fill_in :name, with: 'Alex'
    fill_in :email, with: 'alex@turing.edu'
    fill_in :password, with: 'test123'
    fill_in :password_confirmation, with: 'test234'
    click_button 'Register New User'

    expect(page).to have_current_path(register_path)
    expect(page).to have_content("Email or password are invalid")
  end 
end
