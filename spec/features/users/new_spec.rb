require 'rails_helper'

RSpec.describe 'The new user view/form' do 
  it 'has a form a user can fill out to register' do
    visit register_path
    fill_in 'Name', with: 'Plain Name'
    fill_in 'Email', with: 'User@gmail.com'
    click_button('Register')
    expect(current_path).to eq(user_path(User.last))
    expect(User.last.name).to eq('Plain Name')
    expect(User.last.email).to eq('User@gmail.com')
  end 

  it 'does not register an invalid user' do 
    visit register_path 
    fill_in 'Name', with: 'Plain Name'
    fill_in 'Email', with: ''
    click_button('Register')
    expect(page).to have_content("Email can't be blank")
  end 

  it 'does not register the same email twice' do 
    user = User.create!(name: 'user_3', email: 'email3@gmail.com')
    visit register_path 
    fill_in 'Name', with: 'Plain Name'
    fill_in 'Email', with: 'email3@gmail.com'
    click_button('Register')
    expect(page).to have_content("Email has already been taken")
  end 
end 