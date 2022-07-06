require 'rails_helper'

RSpec.describe "Registration Page" do
  it 'creates a new user' do
    user_count = User.all.length
    visit '/users/register'
    fill_in "Name", with: 'Drew'
    fill_in "Email", with: 'Drew@testemail.com'
    click_button "Register"
    expect(User.all.length).to eq(user_count+1)
  end

  it 'redirects to the user Dashboard' do
    visit '/users/register'
    fill_in "Name", with: 'Drew'
    fill_in "Email", with: 'Drew@testemail.com'
    click_button "Register"
    expect(current_path).to eq("/users/#{User.first.id}")
  end

  it 'flashes an error with invalid credentials' do
    User.create(name: 'Drewb', email: 'Drew@testemail.com')
    visit '/users/register'
    fill_in "Name", with: 'Drew'
    fill_in "Email", with: 'Drew@testemail.com'
    click_button "Register"

    expect(page).to have_content('Invalid Entry')
  end
end
