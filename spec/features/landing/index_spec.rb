# frozen_string_literal: true

require 'rails_helper'
# FactoryBot.find_definitions

RSpec.describe 'Landing Page' do
  it 'has the title of the application' do
    visit '/'
    expect(page).to have_content('Viewing Party Lite')
  end

  it 'has a button to create a new user' do
    visit '/'
    expect(page).to have_button('Create a New User')
    click_button
    expect(current_path).to eq('/register')
  end

  it 'has a link to home' do
    visit '/'
    expect(page).to have_link('Home')
    click_link('Home')
    expect(current_path).to eq('/')
    visit '/register'
    expect(page).to have_link('Home')
    click_link('Home')
    expect(current_path).to eq('/')
  end

  it 'lists current users' do
    user_1 = create(:user)
    user_2 = create(:user)
    visit '/'

    expect(page).to have_link("#{user_1.email}'s Dashboard")
    expect(page).to have_link("#{user_2.email}'s Dashboard")
    click_link("#{user_1.email}'s Dashboard")
    expect(current_path).to eq("/users/#{user_1.id}")
  end
end
