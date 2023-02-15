require 'rails_helper'

RSpec.describe 'Landing Page' do
  let!(:users) { create_list(:user, 10) }
  let!(:user) { create(:user, password: 'testpass123', password_confirmation: 'testpass123') }

  it 'Has all relevant content' do
    visit root_path

    random_user = users.shuffle.sample
    expect(page).to have_content('Viewing Party')
    expect(page).to_not have_content(users.first.email)
    expect(page).to_not have_content(users.last.email)
    expect(page).to_not have_content(random_user.email)

    click_on('Log In')

    fill_in('email', with: user.email)
    fill_in('password', with: 'testpass123')
    click_button('Log In')
    click_on('Back to Home')

    expect(page).to have_content(users.first.email)
    expect(page).to have_content(users.last.email)
    expect(page).to have_content(random_user.email)
  end

  it 'has a has a create button' do
    visit root_path
    click_button('Create a New User')

    expect(current_path).to eq(new_user_path)
  end

  it 'has navigation link' do
    visit root_path
    expect(page).to have_link('Back to Home', href: root_path)
    expect(page).to have_link('Log In', href: users_login_path)
  end

  it 'has a login button if no user is logged in and has a log out if user is logged in' do
    visit root_path
    expect(page).to_not have_link('Log Out')
    click_on('Log In')

    fill_in('email', with: user.email)
    fill_in('password', with: 'testpass123')
    click_button('Log In')

    expect(page).to_not have_link('Log In')
    click_on('Log Out')
    expect(page).to have_link('Log In')
  end
end
