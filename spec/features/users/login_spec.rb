require 'rails_helper'

RSpec.describe 'login page' do
  it 'allows a user to login' do
    user = User.create!(name: 'user', email: 'user@gmail.com', password: '1234', password_confirmation: '1234')
    visit '/login'
    fill_in 'Email', with: "#{user.email}"
    fill_in 'Password', with: "#{user.password}"
    click_button('Login')
    expect(current_path).to eq("/dashboard")
  end

  it 'does not log a user in if their email or password is incorrect' do 
    user = User.create!(name: 'user', email: 'user@gmail.com', password: '1234', password_confirmation: '1234')
    visit "/login"
    fill_in "Email", with: "#{user.email}"
    fill_in "Password", with: "gobblegobble"
    click_button('Login')
    expect(page).to have_content("Invalid email/password")
    expect(current_path).to eq('/login')
  end 
end