require 'rails_helper'

RSpec.describe "Registration Page" do
  it 'has a form for Name and email' do
    visit '/users/register'
    expect(page).to have_form("Name")
    expect(page).to have_form("Email")
  end
  it 'creates a new user' do
    user_count = User.all.length
    visit '/users/register'
    fill_in "Name", with: 'Drew'
    fill_in "email", with: 'Drew@testemail.com'
    click_button "Register"
    expect(User.all.length).to eq(user_count+1)
  end
  it 'redirects to the user Dashboard' do
    visit '/users/register'
    fill_in "Name", with: 'Drew'
    fill_in "email", with: 'Drew@testemail.com'
    click_button "Register"
    expect(current_path).to eq("/users/#{User.first.id}")
  end
  it 'redirects to the user Dashboard' do
    User.create(name: 'Drewb', email: 'd.proebstel@gmail.com')
    visit '/users/register'
    fill_in "Name", with: 'Drew'
    fill_in "email", with: 'Drew@testemail.com'
    click_button "Register"
    expect(flash[:alert]).to match(/Email is Already Used*/)
  end

end
