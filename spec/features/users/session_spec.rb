require 'rails_helper'

RSpec.describe 'user log in' do
  it 'can log in and log out' do
    user1 = User.create!(name: 'Geraldo', email: 'geraldo@trashtv.com', password: 'password', password_confirmation: 'password')
    user2 = User.create!(name: 'Maury', email: 'maury@trashtv.com', password: 'password', password_confirmation: 'password')
    user3 = User.create!(name: 'Jenny', email: 'jenny@trashtv.com', password: 'password', password_confirmation: 'password')

    visit root_path

    fill_in :email, with: 'geraldo@trashtv.com'
    fill_in :password, with: 'password'
    click_on 'Log In'

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content('Welcome Geraldo!')
    expect(page).to_not have_button('Log In')
    expect(page).to_not have_button('Create a New User')
    expect(page).to have_link('Log Out')

    click_link 'Log Out'

    expect(current_path).to eq(root_path)
    expect(page).to have_button('Log In')
    expect(page).to have_button('Create a New User')
    expect(page).to_not have_link('Log Out')
    expect(page).to have_content('Existing Users:')

    within "#user-#{user1.id}" do
      expect(page).to have_content('g**o@t**v.c**m')
    end

    within "#user-#{user2.id}" do
      expect(page).to have_content('m**y@t**v.c**m')
    end

    within "#user-#{user3.id}" do
      expect(page).to have_content('j**y@t**v.c**m')
    end
  end

  it 'shows an error if password is incorrect' do
    user1 = User.create!(name: 'Geraldo', email: 'geraldo@trashtv.com', password: 'password', password_confirmation: 'password')
    user2 = User.create!(name: 'Maury', email: 'maury@trashtv.com', password: 'password', password_confirmation: 'password')
    user3 = User.create!(name: 'Jenny', email: 'jenny@trashtv.com', password: 'password', password_confirmation: 'password')

    visit root_path

    fill_in :email, with: 'geraldo@trashtv.com'
    fill_in :password, with: '12345'
    click_on 'Log In'

    expect(current_path).to eq(root_path)
    expect(page).to have_content('Invalid credentials!')
  end

  it 'shows an error if user does not exist' do
    user1 = User.create!(name: 'Geraldo', email: 'geraldo@trashtv.com', password: 'password', password_confirmation: 'password')
    user2 = User.create!(name: 'Maury', email: 'maury@trashtv.com', password: 'password', password_confirmation: 'password')
    user3 = User.create!(name: 'Jenny', email: 'jenny@trashtv.com', password: 'password', password_confirmation: 'password')

    visit root_path

    fill_in :email, with: 'ricki@trashtv.com'
    fill_in :password, with: 'password'
    click_on 'Log In'

    expect(current_path).to eq(root_path)
    expect(page).to have_content('Invalid credentials!')
  end
end
