require 'rails_helper'

RSpec.describe 'login page' do
  it 'has fields to login that when correctly filled out I am taken to my dashboard' do
    user_1 = User.create!(name: 'Alex', email: 'alex@testexample.com', password: '1234', password_confirmation: '1234')
    visit '/login'
save_and_open_page
    fill_in 'Email', with: "#{user_1.email}"
    fill_in 'Password', with: "#{user_1.password}"
    click_button("Login")
    expect(current_path).to eq("/users/#{user_1.id}")

  end
end
