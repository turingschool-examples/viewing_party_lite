# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'landing page', type: :feature do
  it 'displays the title of the application, a button to create new users, and existing users' do
    user1 = User.create!(name: 'Jane Powell', email: 'jpowell38@gmail.com', password: 'test123')
    
    visit '/login'
  
    fill_in :email, with: 'jpowell38@gmail.com'
    fill_in :password, with: 'test123'

    click_button 'Log In'
    
    user2 = User.create!(name: 'Ann Miller', email: 'amiller@gmail.com', password: 'test123')
    visit '/'

    expect(page).to have_content('Viewing Party Light')
    expect(page).to have_link('Home')
    click_link('Home')
    expect(current_path).to eq('/')
    expect(page).to have_button('Register')
    click_button('Register')
    expect(current_path).to eq('/register')
    visit '/'
    expect(page).to have_content('Existing Users:')
    within '#user-0' do
      expect(page).to have_link("jpowell38@gmail.com's Dashboard")
      expect(page).to_not have_link("amiller@gmail.com's Dashboard")
      click_link("jpowell38@gmail.com's Dashboard")
      expect(current_path).to eq("/users/#{user1.id}")
      visit '/'
    end
    within '#user-1' do
      expect(page).to have_link("amiller@gmail.com's Dashboard")
      expect(page).to_not have_link("jpowell38@gmail.com's Dashboard")
      click_link("amiller@gmail.com's Dashboard")
      expect(current_path).to eq("/users/#{user2.id}")
    end
  end
end
