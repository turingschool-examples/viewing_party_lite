require 'rails_helper'

RSpec.describe 'Landing Page' do
  before(:each) do
    @user1 = User.create!(name: 'Chad', email: 'chad1@gmail.com')
    @user2 = User.create!(name: 'Jessica', email: 'jessica2@gmail.com')
    @user3 = User.create!(name: 'Fiona', email: 'Fiona3@gmail.com')
  end

  it 'should contain title of Viewing Party' do
    visit root_path
    within('#dashboard') do
      expect(page).to have_content('Viewing Party')
    end
  end

  it 'should contain button titled create new user' do
    visit root_path
    within('#new_user') do
      expect(page).to have_button('Create a New User')
      click_button('Create a New User')
      expect(current_path).to eq('/register')
    end
  end

  it 'should contain a list of existing users' do
    visit root_path
    within('#existing_users') do
      expect(page).to have_content(@user1.name)
      expect(page).to have_content(@user2.name)
      expect(page).to have_content(@user3.name)
      expect(page).to have_no_content('Bob')
    end
  end

  it 'the name of each existing user link to that users dashboard' do
    visit root_path
    within('#existing_users') do
      expect(page).to have_link(@user1.name)
      expect(page).to have_link(@user2.name)
      expect(page).to have_link(@user3.name)
      click_link @user1.name
      expect(current_path).to eq(user_path(@user1.id))
    end
  end

  it 'should contain a link to go back to the landing page' do
    visit root_path
    within('#dashboard') do
      expect(page).to have_link('Home')
      click_link('Home')
      expect(current_path).to eq(root_path)
    end
  end
end
