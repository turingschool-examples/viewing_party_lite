require 'rails_helper'

RSpec.describe 'New page', type: :feature do
  it 'has a form' do
    visit '/register'
    expect(page).to have_field('User name')
    expect(page).to have_field('Email')
    expect(page).to have_button('Create User')
  end

  it 'can fill out and submit the form' do
    visit '/register'
    fill_in :User, with: 'SWilks'    
    fill_in :Email, with: 'stephenwilkens@gmail.com'    
    click_button 'Create User'
    new_user = User.last
    expect(current_path).to eq("/users/#{new_user.id}")
  end

  it 'can only use unique emails' do
    visit '/register'
    fill_in :User, with: 'SWilks'    
    fill_in :Email, with: 'stephenwilkens@gmail.com'    
    click_button 'Create User'
    new_user = User.last
    expect(current_path).to eq("/users/#{new_user.id}")

    visit '/register'
    fill_in :User, with: 'Bob'    
    fill_in :Email, with: 'stephenwilkens@gmail.com'    
    click_button 'Create User'
    expect(page).to have_content('Email address is blank/already in use.')
    expect(current_path).to eq(register_path)
  end
end