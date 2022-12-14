require 'rails_helper'

RSpec.describe 'login form' do
  before(:each) do
    @user = User.create!(name: 'Smashley', email: 'smashley@turing.edu', password: 'test',
                         password_confirmation: 'test')
    visit '/login'
  end

  it 'redirects to user dashboard' do
    fill_in(:email, with: @user.email)
    fill_in(:password, with: @user.password)
    click_on 'Log In'
    expect(current_path).to eq("/dashboard")
  end

  it 'does not work with wrong invalid credentials' do
    fill_in(:email, with: 'smashley@.edu')
    click_on 'Log In'
    expect(current_path).to eq('/login')
    expect(page).to have_content('Incorrect Email entered')
  end
end
