require 'rails_helper'

RSpec.describe 'user login page' do
  before :each do
    @user_1 = User.create!(name: 'Jim', email: 'jim.halpert@gmail.com', username: 'greatsalesman', password: 'pass')
    @user_2 = User.create!(name: 'Pam', email: 'pam.halpert@gmail.com', username: 'receptionist', password: '123pass')
  end

  it 'logs in a user' do
    visit root_path

    expect(page).to have_button("Log In")
    click_on "Log In"

    expect(current_path).to eq("/login")
    
    fill_in :username, with: 'greatsalesman'
    fill_in :password, with: 'pass'
    click_on "Log In"

    expect(current_path).to eq(user_path(@user_1))
  end

  it 'it shows an error message if user enters bad credentials' do
    visit root_path

    expect(page).to have_button("Log In")
    click_on "Log In"

    expect(current_path).to eq("/login")
    
    fill_in :username, with: 'greatsalesman'
    fill_in :password, with: 'password'
    click_on "Log In"

    expect(page).to have_content("Sorry, your credentials are bad.")
  end
end