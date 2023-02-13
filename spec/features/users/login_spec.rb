require 'rails_helper'

RSpec.describe 'Users New' do
  let!(:user) { create(:user, password: 'testpass123', password_confirmation: 'testpass123') }
  it 'can login a user' do
    visit users_login_path

    fill_in('email', with: user.email)
    fill_in('password', with: 'testpass123')
    click_button('Log In')

    expect(current_path).to eq(user_path(user))
  end

  it 'will not log in if email is wrong' do
    visit users_login_path

    fill_in('email', with: 'wrong@example.com')
    fill_in('password', with: 'testpass123')
    click_button('Log In')

    expect(page).to have_content('Email does not match any in system')
  end

  it 'will not log in if  password is wrong' do
    visit users_login_path

    fill_in('email', with: user.email)
    fill_in('password', with: 'wrongpass123')
    click_button('Log In')

    expect(page).to have_content('Password is incorrect')
  end
end