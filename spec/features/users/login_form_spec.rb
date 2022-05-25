require 'rails_helper'

RSpec.describe 'login page' do
  it 'has fields to login that when correctly filled out I am taken to my dashboard' do
    user_1 = User.create!(name: 'Alex', email: 'alex@testexample.com', password: '1234', password_confirmation: '1234')
    visit '/login'

    fill_in 'Email', with: "#{user_1.email}"
    fill_in 'Password', with: "#{user_1.password}"
    click_button("Login")
    expect(current_path).to eq(user_dashboard_path(user_1))

  end

  context 'sad path' do
    it 'redirects to login form if user fails to enter correct credentials' do
      user_1 = User.create!(name: 'Alex', email: 'alex@testexample.com', password: '1234', password_confirmation: '1234')
      visit '/login'

      fill_in 'Email', with: "#{user_1.email}"
      fill_in 'Password', with: "i forgot"
      click_button("Login")

      expect(current_path).to eq('/login')
      within '.flash' do
        expect(page).to have_content('Invalid credentials')
      end
    end
  end
end
