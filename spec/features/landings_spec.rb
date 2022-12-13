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

  it 'has a section that displays existing users emails. Each email is a link to their dashboard page' do
    user1 = create(:user)
    user2 = create(:user)

    visit current_path

    expect(page).to have_content('Existing Users')
    expect(page).to have_content(user1.email)
    expect(page).to have_content(user2.email)
    expect(page).to_not have_content(user1.name)
    expect(page).to_not have_content(user2.name)
  end

  it 'has a home link at top of the page, that goes to landing page' do
    expect(page).to have_link('Home')
    click_link('Home')

    expect(current_path).to eq(root_path)
  end

  it 'has a link can log in with valid credentials' do
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

  xit 'keeps a user logged in after registering' do
    user = create(:user)

    fill_in(:user_name, with: Faker::Games::Pokemon.name)
    fill_in(:user_email, with: Faker::Internet.email)
    password = Faker::Internet.password(min_length: 10, max_length: 20)
    fill_in(:user_password, with: password)
    fill_in(:user_password_confirmation, with: password)
    click_button('Register')
  end
end
