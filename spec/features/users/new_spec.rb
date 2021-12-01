require 'rails_helper'

RSpec.describe 'user register form' do
  it 'visit the register path' do
    visit register_path

    expect(current_path).to eq(register_path)
  end

  it 'has a form to create a user' do
    visit register_path
    fill_in 'Name', with: 'User 1'
    fill_in 'Email', with: 'user@email.com'
    click_button 'Create User'

    user = User.last

    expect(current_path).to eq(dashboard_path(user))
    expect(page).to have_content("Welcome #{user.name}")
  end
end
