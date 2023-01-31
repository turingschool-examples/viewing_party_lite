require 'rails_helper'

RSpec.describe 'Users New' do
  let!(:user) { create(:user) }
  it 'can create a new user' do
    visit new_user_path
    expect(current_path).to eq('/register')

    fill_in('user[name]', with: 'Samuel Cox')
    fill_in('user[email]', with: 'samuel@example.com')
    click_button('Register')

    expect(User.exists?(name: 'Samuel Cox')).to eq true
    expect(User.exists?(email: 'samuel@example.com')).to eq true
  end

  it 'will not create a new user if the email already exists' do
    visit new_user_path

    fill_in('user[name]', with: user.name)
    fill_in('user[email]', with: user.email)
    click_button('Register')

    expect(current_path).to eq('/register')

    expect(page).to have_content('User already exists with given email')
  end
end