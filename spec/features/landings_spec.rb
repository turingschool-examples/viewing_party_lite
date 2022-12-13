require 'rails_helper'

RSpec.describe 'Landing Page' do
  before :each do
    visit root_path
  end

  it 'has a landing page' do
    expect(current_path).to eq(root_path)
  end

  it 'has a button to create a New User' do
    expect(page).to have_link('Create a new user')

    click_link('Create a new user')

    expect(current_path).to eq(register_path)
  end

  it 'has a home link at top of the page, that goes to landing page' do
    expect(page).to have_link('Home')
    click_link('Home')

    expect(current_path).to eq(root_path)
  end

  it 'has a link that can log in with valid credentials' do
    user = create(:user)

    click_on 'I already have an account'

    expect(current_path).to eq(login_path)

    fill_in(:email, with: user.email)
    fill_in(:password, with: user.password)
    click_on 'Log In'

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Welcome, #{user.name}!")
  end

  it 'cannot login with invalid credentials' do
    user = create(:user)

    click_on 'I already have an account'

    fill_in(:email, with: user.email)
    fill_in(:password, with: Faker::Internet.password(min_length: 10, max_length: 20))
    click_on 'Log In'

    expect(current_path).to eq(login_path)
    expect(page).to have_content('Incorrect password')
  end

  it 'no longer has a link to log in or create account when logged in' do
    user = create(:user)
    visit login_path

    fill_in(:email, with: user.email)
    fill_in(:password, with: user.password)
    click_on 'Log In'

    expect(current_path).to eq(root_path)
    expect(page).to have_content('Log out')
    expect(page).to_not have_content('Create a new user')
    expect(page).to_not have_content('I already have an account')
  end

  it 'can successfully logout' do
    user = create(:user)
    visit login_path
    fill_in(:email, with: user.email)
    fill_in(:password, with: user.password)
    click_on 'Log In'
    click_on 'Log out'

    expect(current_path).to eq(root_path)
    expect(page).to_not have_content('Log out')
    expect(page).to have_content('Create a new user')
    expect(page).to have_content('I already have an account')
  end

  it 'when logged in, there is a section that displays existing users emails. Each email is a link to their dashboard page' do
    user1 = create(:user)
    user2 = create(:user)

    visit login_path

    fill_in(:email, with: user1.email)
    fill_in(:password, with: user1.password)
    click_on 'Log In'

    expect(page).to have_content('Existing Users')
    expect(page).to have_content(user1.email)
    expect(page).to have_content(user2.email)
  end

  it 'cannot see existing users if not logged in' do
    user1 = create(:user)
    user2 = create(:user)

    expect(page).to_not have_content('Existing Users')
    expect(page).to_not have_content(user1.email)
    expect(page).to_not have_content(user2.email)
  end

  it 'if I try to visit my discover page while logged out, it redirects to the landing page' do
    user = create(:user)

    visit user_path(user)

    expect(current_path).to eq(root_path)
    expect(page).to have_content('You must be logged in to see that page')
  end
end
