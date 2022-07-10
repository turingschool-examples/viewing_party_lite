require 'rails_helper'

RSpec.describe '#new' do
  it 'register a new user' do
    visit register_path

    fill_in 'Name', with: 'Bryce Wein', visible: false
    fill_in 'Email', with: 'bryce.wein@gmail.com', visible: false
    fill_in 'Password', with: '1234', visible: false
    fill_in 'Password confirmation', with: '1234', visible: false

    click_button 'Sign Up'

    user = User.find_by name: 'Bryce Wein'

    expect(current_path).to eq(user_path(user))
  end
  it 'will only accept unique emails' do
    User.create!({ name: 'Frank', email: 'bryce.wein@gmail.com', password: '111', password_confirmation: '111' })

    visit register_path
    fill_in 'Name', with: 'Bryce Wein', visible: false
    fill_in 'Email', with: 'bryce.wein@gmail.com', visible: false
    fill_in 'Password', with: '1234', visible: false
    fill_in 'Password confirmation', with: '1234', visible: false

    click_button 'Sign Up'

    expect(current_path).to eq(register_path)
  end
end
