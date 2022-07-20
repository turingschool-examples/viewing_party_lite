# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User Discover Page' do
  it 'discover button' do
    @user1 = User.create!(name: 'Jimar', email: 'jimar@jimar.com', password: 'Isuck', password_confirmation: 'Isuck')
    @user2 = User.create!(name: 'NickT', email: 'NickT@jimar.com', password: 'Isuck', password_confirmation: 'Isuck')
    visit '/login'
    fill_in 'email', with: 'jimar@jimar.com'
    fill_in 'password', with: 'Isuck'
    click_button 'Login'

    visit '/users/dashboard'
    click_button 'Discover Movies'
    expect(current_path).to eq("/users/discover")
  end

  it 'has a button to see top 20 movies' do
    @user1 = User.create!(name: 'Jimar', email: 'jimar@jimar.com', password: 'Isuck', password_confirmation: 'Isuck')
    # session[:user_id] = @user1.id
    visit '/login'
    fill_in 'email', with: 'jimar@jimar.com'
    fill_in 'password', with: 'Isuck'
    click_button 'Login'

    visit "/users/discover"
    expect(page).to have_button('Top Rated Movies')
  end
end
