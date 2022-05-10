require 'rails_helper'

RSpec.describe 'landing page' do
  before do
    @user_1 = User.create!(name: 'user_1', email: 'test_5@gmail.com')
    @user_2 = User.create!(name: 'user_2', email: 'test_3@gmail.com')
    @user_3 = User.create!(name: 'user_3', email: 'test_2@gmail.com')

    visit root_path
  end

  it 'has a link to redirect to root' do
    link = "Home"

    within '.links' do
      expect(page).to have_link(link)
    end

    click_link "Home"
    expect(page).to have_current_path(root_path)
  end

  it 'has an application title' do
    within '.title' do
      expect(page).to have_content('Viewing Party Lite')
    end
  end

  it 'has a button to create a new user' do
    within '.new-user' do
      click_button 'Register'
      expect(current_path).to eq(register_path)
    end
  end

  it 'displays all users' do
    within '.all-users' do
      expect(page).to have_link(@user_1.name)
      expect(page).to have_link(@user_2.name)
      expect(page).to have_link(@user_3.name)
    end
  end

  it 'users name links to show path' do
    click_link(@user_1.name)

    expect(current_path).to eq(user_path(@user_1))
    expect(current_path).to_not eq(user_path(@user_2))
  end
end