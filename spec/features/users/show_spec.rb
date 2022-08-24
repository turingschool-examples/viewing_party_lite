require 'rails_helper'

RSpec.describe 'show page', type: :feature do
  it 'has user information on show page' do
    user1 = User.create!(name: 'sally', email: 'sally@turing.com')
    user2 = User.create!(name: 'tom', email: 'tom@turing.com')

    visit user_path(user1)

    expect(page).to have_content('Name: sally') 
    expect(page).to have_content('Email: sally@turing.com') 
    expect(page).to_not have_content('Name: tom')
  end
end