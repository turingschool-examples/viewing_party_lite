# frozen_string_literal: true

require 'rails_helper'

describe 'user new/registration page' do
  before do
    visit '/register'
  end
  it 'has a form to create a new user and once created it redirects to the new users show page' do
    expect(page).to have_content('Register a New User')

    fill_in 'user[name]', with: 'Jane'
    fill_in 'user[email]', with: 'eleven@upsidedown.com'
    click_button('Create New User')

    user = User.last
    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("#{user.name}'s Dashboard")
  end
end
