require 'rails_helper'

RSpec.describe 'user log in' do
  it 'links to a form to log in' do
    user1 = User.create!(name: 'Geraldo', email: 'geraldo@trashtv.com', password: 'password', password_confirmation: 'password')
    user2 = User.create!(name: 'Maury', email: 'maury@trashtv.com', password: 'password', password_confirmation: 'password')
    user3 = User.create!(name: 'Jenny', email: 'jenny@trashtv.com', password: 'password', password_confirmation: 'password')

    visit root_path

    click_link('Existing Users Log In Here')

    expect(current_path).to eq(login_path)

    fill_in :email, with: 'geraldo@trashtv.com'
    fill_in :password, with: 'password'
    click_on 'Log In'

    expect(current_path).to eq user_path(user1)
    expect(page).to have_content('Welcome Geraldo')
  end

  it 'shows an error if password is incorrect' do
    user1 = User.create!(name: 'Geraldo', email: 'geraldo@trashtv.com', password: 'password', password_confirmation: 'password')
    user2 = User.create!(name: 'Maury', email: 'maury@trashtv.com', password: 'password', password_confirmation: 'password')
    user3 = User.create!(name: 'Jenny', email: 'jenny@trashtv.com', password: 'password', password_confirmation: 'password')

    visit root_path

    click_link('Existing Users Log In Here')

    expect(current_path).to eq(login_path)

    fill_in :email, with: 'geraldo@trashtv.com'
    fill_in :password, with: '12345'
    click_on 'Log In'

    expect(current_path).to eq(root_path)
    expect(page).to have_content('Invalid credentials')
  end

  it 'shows an error if user does not exist' do
    user1 = User.create!(name: 'Geraldo', email: 'geraldo@trashtv.com', password: 'password', password_confirmation: 'password')
    user2 = User.create!(name: 'Maury', email: 'maury@trashtv.com', password: 'password', password_confirmation: 'password')
    user3 = User.create!(name: 'Jenny', email: 'jenny@trashtv.com', password: 'password', password_confirmation: 'password')

    visit root_path

    click_link('Existing Users Log In Here')

    expect(current_path).to eq(login_path)

    fill_in :email, with: 'ricki@trashtv.com'
    fill_in :password, with: 'password'
    click_on 'Log In'

    expect(current_path).to eq(root_path)
    expect(page).to have_content('Invalid credentials')
  end
end
