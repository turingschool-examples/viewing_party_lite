# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Landing Page' do
  before :each do
    @user1 = User.create!(name: 'Jimar', email: 'jimar@jimar.com', password: 'test123', password_confirmation: 'test123')
    @user2 = User.create!(name: 'NickT', email: 'NickT@jimar.com', password: 'test123', password_confirmation: 'test123')
  end

  it 'shows the title of the application' do
    visit root_path
    # save_and_open_page
    expect(page).to have_content('Welcome to Viewing Party Lite')
  end

  it 'has a button to create a new user' do
    visit root_path
    expect(page).to have_button('Create New User')
    click_button 'Create New User'
    expect(current_path).to eq(register_path)
  end

  it "has a link to the login page" do
    visit root_path
    click_button "Login"
    expect(current_path).to eq(login_path)
  end

end
