require 'rails_helper'

RSpec.describe 'the landing page' do
  it 'shows a list of all users as links to their dashboard' do
    user1 = User.create!(name: 'Geraldo', email: 'geraldo@trashtv.com')
    user2 = User.create!(name: 'Maury', email: 'maury@trashtv.com')
    user3 = User.create!(name: 'Jenny', email: 'jenny@trashtv.com')

    visit root_path

    within "#user-#{user1.id}" do
      expect(page).to have_link("geraldo@trashtv.com's Dashboard", href: user_path(user1))
    end

    within "#user-#{user2.id}" do
      expect(page).to have_link("maury@trashtv.com's Dashboard", href: user_path(user2))
    end

    within "#user-#{user3.id}" do
      expect(page).to have_link("jenny@trashtv.com's Dashboard", href: user_path(user3))
    end

    click_link("geraldo@trashtv.com's Dashboard")
    expect(current_path).to eq user_path(user1)
  end

  it 'has a button to create a new user that directs to the register page' do
    user1 = User.create!(name: 'Geraldo', email: 'geraldo@trashtv.com')
    user2 = User.create!(name: 'Maury', email: 'maury@trashtv.com')
    user3 = User.create!(name: 'Jenny', email: 'jenny@trashtv.com')

    visit root_path

    expect(page).to have_button('New User')
    click_button('New User')
    expect(current_path).to eq register_path
  end
end
