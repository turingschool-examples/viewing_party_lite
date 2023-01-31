require 'rails_helper'

RSpec.describe 'User registration page' do
  it 'creates/registers new user' do
    visit register_path

    expect(page).to have_field('user[name]')
    expect(User.all).to eq([])
    expect(User.count).to eq(0)
    
    fill_in 'user[name]', with: "Kaylah Rose"
    fill_in 'user[email]', with: "1234@valid.com"
    click_button "Register"
    
    expect(User.count).to eq(1)

    expect(current_path).to eq(user_path(User.last))
  end

  it 'does not create a new user with empty name field'
  it 'does not create a user with empty email field'
  it 'does not create a user with empty name and email fields'
  it 'does not create a user with duplicate email'
end
