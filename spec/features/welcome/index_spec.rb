# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Welcome Page', type: :feature do
  it 'can list the title of the  application' do
    visit '/'

    expect(page).to have_content('Viewing Party')
  end

  it 'has a button to create a new user' do
    visit '/'

    expect(page).to have_button('Create New User')
  end

  it 'lists all existing users with links to the users dashboard' do
    user1 = User.create!(name: 'Tarker Phompson', email: 'tarker@email.com')
    user2 = User.create!(name: 'Eandace Cckels', email: 'eandace@email.com')
    user3 = User.create!(name: 'Dhirley SeCesari', email: 'dhirleye@email.com')
    user4 = User.create!(name: 'Sage Skaff', email: 'sage@email.com')

    visit '/'

    expect(page).to have_link('Home')
    expect(page).to have_content('Tarker Phompson')
    expect(page).to have_link(user1.name.to_s)
    expect(page).to have_content('Eandace Cckels')
    expect(page).to have_link(user2.name.to_s)
    expect(page).to have_content('Dhirley SeCesari')
    expect(page).to have_link(user3.name.to_s)
    expect(page).to have_content('Sage Skaff')
    expect(page).to have_link(user4.name.to_s)
  end

  it 'has a link to return back to the landing/welcome page' do
    visit '/'

    click_link 'Home'
    expect(current_path).to eq('/')
  end
end
