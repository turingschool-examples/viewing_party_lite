# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Landing Page' do
  before :each do
    @eli = User.create!(name: 'Eli', email: 'es@g')
    @sunny = User.create!(name: 'Sunny', email: 'sm@g')

    visit '/'
  end

  it 'contains app title' do
    expect(page).to have_content('Viewing Party Lite')
  end

  it 'has button to create user' do
    expect(page).to have_button('Create New User')
    click_button 'Create New User'
    expect(current_path).to eq('/register')
  end

  it 'lists existing users with links to dashboard' do
    within "#user-#{@eli.id}" do
      expect(page).to have_link('Eli')
    end

    within "#user-#{@sunny.id}" do
      expect(page).to have_link('Sunny')
      click_on 'Sunny'
      expect(current_path).to eq("/users/#{@sunny.id}")
    end
  end

  it 'has link to landing page' do
    expect(page).to have_link('Home')
    click_on 'Home'
    expect(current_path).to eq('/')
  end
end
