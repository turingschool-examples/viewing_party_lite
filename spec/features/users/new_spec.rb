# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Register' do
  before :each do
    @eli = User.create!(name: 'Eli', email: 'es@g')

    visit '/register'
  end

  it 'can register user' do
    fill_in 'Name', with: 'Sunny'
    fill_in 'Email', with: 'sm@g'
    click_on 'Create User'
    expect(current_path).to eq("/users/#{@eli.id + 1}")
    expect(page).to have_content("Sunny's Dashboard")
    expect(page).to_not have_content("Eli's Dashboard")
  end

  it 'sad path testing 1' do # no name
    fill_in 'Email', with: 'sm@g'
    click_on 'Create User'
    expect(current_path).to eq('/register')
    expect(page).to_not have_content("Sunny's Dashboard")
  end

  it 'sad path testing 2' do # duplicate email
    fill_in 'Name', with: 'Sunny'
    fill_in 'Email', with: 'es@g'
    click_on 'Create User'
    expect(current_path).to eq('/register')
    expect(page).to_not have_content("Sunny's Dashboard")
  end

  it 'has link to landing page' do
    expect(page).to have_link('Home')
    click_on 'Home'
    expect(current_path).to eq('/')
  end
end
