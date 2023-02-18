require 'rails_helper'

RSpec.describe 'the landing page' do
  let!(:users) { create_list(:user, 3) }
  let!(:user1) { users.first }
  let!(:user2) { users.second }
  let!(:user3) { users.third }

  before :each do
    visit root_path
  end

  it 'can only use link to dashboard if logged in and user' do

    within "#user-#{user1.id}" do
      expect(page).to have_content("#{user1.name}: #{user1.email.gsub(/(?<=[\w\d])[\w\d]+(?=[\w\d])/, "**")}")
    end

    within "#user-#{user2.id}" do
      expect(page).to have_content("#{user2.name}: #{user2.email.gsub(/(?<=[\w\d])[\w\d]+(?=[\w\d])/, "**")}")
    end

    within "#user-#{user3.id}" do
      expect(page).to have_content("#{user3.name}: #{user3.email.gsub(/(?<=[\w\d])[\w\d]+(?=[\w\d])/, "**")}")
    end

    fill_in :email, with: "#{user1.email}"
    fill_in :password, with: "#{user1.password}"
    click_on 'Login 🎟'
    click_link 'Home'
    
    expect(page).to_not have_link('Admin Dashboard')

    within "#user-#{user1.id}" do
      expect(page).to have_link("#{user1.email}'s Dashboard", href: dashboard_path)
    end

    within "#user-#{user2.id}" do
      expect(page).to have_content("#{user2.name}: #{user2.email}")
    end

    within "#user-#{user3.id}" do
      expect(page).to have_content("#{user3.name}: #{user3.email}")
    end

    click_link("#{user1.email}'s Dashboard")
    expect(current_path).to eq(dashboard_path)
  end

  it 'has a button to create a new user that directs to the register page' do

    expect(page).to have_link('Create a New User')

    click_link('Create a New User')

    expect(current_path).to eq register_path
    expect(page).to have_field(:name)
    expect(page).to have_field(:email)
    expect(page).to have_field(:password)
    expect(page).to have_field(:password_confirmation)
    expect(page).to have_button('Create New User')
  end

  it 'has a 🎟 button to login' do

    expect(page).to have_field(:email)
    expect(page).to have_field(:password)
    expect(page).to have_button('Login 🎟')
  end
end
