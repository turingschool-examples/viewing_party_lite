require 'rails_helper'

RSpec.describe 'User registration page' do
  it 'creates/registers new user' do
    visit register_path
    
    fill_in "Name", with: "Kaylah Rose"
    fill_in "Email", with: "1234@valid.com"
    click_button "Register"

    expect(current_path).to eq(users_path(User.last))
  end

  it 'does not create a new user with empty name field'
  it 'does not create a user with empty email field'
  it 'does not create a user with empty name and email fields'
  it 'does not create a user with duplicate email'
end
