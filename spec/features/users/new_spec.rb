require 'rails_helper'

RSpec.describe 'new user registration page', type: :feature do
  it 'has a form to create a new user then sends user to show page' do
    visit register_path
    fill_in :name, with: 'Sally'
    fill_in :email, with: 'sally@turing.com'

    click_button 'Register New User'

    expect(current_path).to eq(user_path(User.last.id))
  end
end
