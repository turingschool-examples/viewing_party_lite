# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'New User' do
  it 'should have a form to create new user' do
    visit '/register'

    expect(page).to have_field('Name')
    expect(page).to have_field('Email')
    expect(page).to have_button('Register')
    fill_in 'Name', with: 'Jimbo'
    fill_in 'Email', with: 'Jimbo@gmail.com'
    fill_in 'Password', with: 'Jimbo@gmail.com'
    click_button 'Register'

    expect(current_path).to eq("/users/#{User.last.id}")
  end

  it "should have password field and redirects to user show page" do
    visit '/register'

    expect(page).to have_field("Password")
    expect(page).to have_button('Register')
    fill_in 'Name', with: 'Jimbo'
    fill_in 'Email', with: 'Jimbo@gmail.com'
    fill_in 'Password', with: "password123"
    click_button 'Register'

    expect(page).to have_content("Jimbo")
  end
end
