require 'rails_helper'

RSpec.describe 'Landing Page' do
  it 'has a landing page' do
    visit root_path
    expect(current_path).to eq(root_path)
  end

  it 'has a button to create a New User' do
    visit root_path

    expect(page).to have_button('Create a New User')

    click_button('Create a New User')

    expect(current_path).to eq(register_path)
  end

  it 'has a section that displays existing users emails. Each email is a link to their dashboard page' do
    user1 = create(:user)
    user2 = create(:user)

    visit root_path

    expect(page).to have_content('Existing Users')
    expect(page).to have_content(user1.email)
    expect(page).to have_content(user2.email)
    expect(page).to_not have_content(user1.name)
    expect(page).to_not have_content(user2.name)
  end

  it 'has a home link at top of the page, that goes to landing page' do
    visit root_path

    expect(page).to have_link('Home')
    click_link('Home')

    expect(current_path).to eq(root_path)
  end

  it 'has a link can log in with valid credentials' do
    user = create(:user, password: 'password123')

    visit root_path

    click_on 'I already have an account'

    expect(current_path).to eq(login_path)

    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_on 'Log In'

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Welcome, #{user.name}!")
  end
end
