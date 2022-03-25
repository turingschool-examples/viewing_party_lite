# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'the landing page' do
  it 'shows the applications name' do
    visit '/'
    expect(page).to have_content('Viewing Party Lite')
  end

  it 'has a button to create a new user' do
    visit '/'
    expect(page).to have_button("Create New User")
    click_button "Create New User"
    expect(current_path).to eq("/register")
  end

  it 'displays all current registered users' do
    u1 = User.create!(name: 'Mr 1', email: 'Test1@test.com')
    u2 = User.create!(name: 'Mrs 2', email: 'Test2@test.com')
    u3 = User.create!(name: 'Mrs 3', email: 'Test3@test.com')
    u4 = User.create!(name: 'Mr 4', email: 'Test4@test.com')
    visit '/'
    within '.registered' do
      expect(page).to have_content(u1.name)
      expect(page).to have_content(u2.name)
      expect(page).to have_content(u3.name)
      expect(page).to have_content(u4.name)
    end
  end

  it 'has a link back to the landing page (itself)' do
    visit '/'
    expect(page).to have_button('HOME')
    click_button 'HOME'
    expect(current_path).to eq('/')
  end
end
