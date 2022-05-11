require 'rails_helper'

RSpec.describe 'Landing Page' do
  before do
    visit '/'
  end
  it 'shows the title of the application' do
    within '#title' do
      expect(page).to have_content("Viewing Party Lite")
    end
  end

  it 'has a button to create a new user' do
    expect(page).to have_content("Create New User")
  end

  it 'has a list of existing users with their names as links to their individual dashboard' do
    user1 = User.create!(name: 'Will', email: 'abc@mail.com')
    user2 = User.create!(name: 'Craig', email: 'zyx@mail.com')
    user3 = User.create!(name: 'Alicia', email: '321@mail.com')

    within "#existing users-#{user1.id}" do
      expect(page).to have_content("#{user1.name}")
      expect(page).to have_link("#{user1.name} dashboard")
      click_link "#{user1.name} dashboard"
      expect(page).to have_current_path("/users/#{user1.id}")
    end

    within "#existing users-#{user2.id}" do
      expect(page).to have_content("#{user2.name}")
      expect(page).to have_link("#{user2.name} dashboard")
      click_link "#{user2.name} dashboard"
      expect(page).to have_current_path("/users/#{user2.id}")
    end

    within "#existing users-#{user3.id}" do
      expect(page).to have_content("#{user3.name}")
      expect(page).to have_link("#{user3.name} dashboard")
      click_link "#{user3.name} dashboard"
      expect(page).to have_current_path("/users/#{user3.id}")
    end
  end
end