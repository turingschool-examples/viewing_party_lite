# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User Show Page' do
  it 'show me a users dashboard ' do
    @user1 = User.create!(name: 'Jimar', email: 'jimar@jimar.com', password: 'Isuck', password_confirmation: 'Isuck')
    @user2 = User.create!(name: 'NickT', email: 'NickT@jimar.com', password: 'Isuck', password_confirmation: 'Isuck')
    visit login_path
    fill_in 'email', with: 'jimar@jimar.com'
    fill_in 'password', with: 'Isuck'
    click_button "Login"

    visit '/users/dashboard'

    expect(page).to have_content("Jimar's Dashboard")
    expect(page).to_not have_content("NickT's Dashboard")

    expect(page).to have_link('Viewing Parties')
    expect(page).to have_button('Discover Movies')
  end
end
