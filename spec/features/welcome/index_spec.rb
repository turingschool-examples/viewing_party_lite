# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Landing Page' do
  it 'shows title of app, button to create a user' do
    visit root_path

    expect(page).to have_content('Viewing Party')
    expect(page).to have_button('Create a New User')
  end

  it 'lists existing users with links to user dashboard' do
    user1 = User.create!(name: 'John Doe', email: 'john@doe.com')
    user2 = User.create!(name: 'Jane Smith', email: 'jane@gmail.com')

    visit root_path

    expect(page).to have_content('Existing Users:')

    within '#existing_users' do
      expect(page).to have_link('john@doe.com', href: user_path(user1))
      expect(page).to have_link('jane@gmail.com', href: user_path(user2))
    end
  end

  it 'has a link to the landing page' do
    visit root_path

    expect(page).to have_link('Home', href: root_path)
  end
end
