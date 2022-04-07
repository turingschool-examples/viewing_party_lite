require 'rails_helper'

RSpec.describe 'User Registration' do
  it 'creates a user' do
    visit '/register'
    fill_in 'Name', with: 'Test Guy'
    fill_in 'Email', with: 'Tguy@gmail.com'
    fill_in 'Password', with: 'normanthecat'
    fill_in 'Password confirmation', with: 'normanthecat'
    click_on 'Register'

    test_user = User.first

    expect(current_path).to eq("/users/#{test_user.id}")
    expect(page).to have_content('Account Successfully Created')
    expect(test_user.name).to eq('Test Guy')
  end

  it 'does not allow duplicate emails' do
    a_test_user = User.create(name: 'guy', email: 'Tguy@gmail.com', password: '1234')
    visit '/register'
    fill_in 'Name', with: 'Test Guy 2'
    fill_in 'Email', with: 'Tguy@gmail.com'
    fill_in 'Password', with: 'normanthecat'
    fill_in 'Password confirmation', with: 'normanthecat'
    click_on 'Register'

    expect(current_path).to eq('/register')
    expect(page).to have_content('Please enter a valid email/ password')
  end

  it 'will not create a user when passwords dont match' do
    visit '/register'
    fill_in 'Name', with: 'Test Guy'
    fill_in 'Email', with: 'Tguy@gmail.com'
    fill_in 'Password', with: 'normanthecat'
    fill_in 'Password confirmation', with: 'peep'
    click_on 'Register'

    expect(current_path).to eq('/register')
    expect(page).to have_content('Please enter a valid email/ password')
  end
end
