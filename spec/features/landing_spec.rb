# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Application' do
  it 'has a link to create a new user' do
    visit root_path
    expect(page).to have_content('Viewing Party')
    expect(page).to have_button('Create a New User')

    click_on('Create a New User')
    expect(current_path).to eq('/register')
  end

  it 'has existing users with emails listed' do
    user_1 = create(:user, email: "user_1@gmail.com", password: "password123", password_confirmation: "password123")
    user_2 = create(:user)

    visit '/login'

    fill_in(:email, with: 'user_1@gmail.com')
    fill_in(:password, with: 'password123')
    click_button("Log In")
    
    visit root_path
    
    within("#users") do
      expect(page).to have_content('Existing Users')
      expect(page).to have_content(user_1.email)
      expect(page).to have_content(user_2.email)
    end

    # click_link(user_1.name.to_s)
    # expect(current_path).to eq("/users/#{user_1.id}")
  end

  it 'has a link back to landing page' do
    visit root_path

    expect(page).to have_link('Home')

    click_link('Home')

    expect(current_path).to eq(root_path)
  end
end
