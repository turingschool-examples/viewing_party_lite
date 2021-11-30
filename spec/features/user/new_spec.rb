require 'rails_helper'

RSpec.describe 'new user register page' do
  it 'has a form to create a new user' do
    visit register_path

    fill_in :name, with: 'user'
    fill_in :email, with: 'email@email.com'
    click_button 'Register'

    expect(current_path).to eq(user_path(User.find_by email: 'email@email.com'))
  end
end