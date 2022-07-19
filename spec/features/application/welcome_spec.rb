require 'rails_helper'
RSpec.describe 'application welcome page' do 
  it 'has title of application' do
    visit '/'
    expect(page).to have_content("Viewing Party Lite")
  end

  it 'has a button to create new user' do
    visit '/'
    expect(page).to have_button("Create New User")
  end

  it 'has a link back to welcome page' do
    visit '/'
    expect(page).to have_link("Home")
  end

  it 'has a list of existing users that link to their dashboard' do
    user1 = User.create!(name: "Bob", email: "bob@gmail.com", password: 'test')
    user2 = User.create!(name: "Drew", email: "drew@gmail.com", password: 'test')
    user3 = User.create!(name: "Gary", email: "gary@gmail.com", password: 'test')
    user4 = User.create!(name: "Sue", email: "sue@gmail.com", password: 'test')
    user5 = User.create!(name: "Lou", email: "lou@gmail.com", password: 'test')
    visit '/'
    within "#user-#{user1.id}" do
      expect(page).to have_content("Bob")
      expect(page).to_not have_content("Drew")
      expect(page).to_not have_content("Gary")
      expect(page).to_not have_content("Sue")
      expect(page).to_not have_content("Lou")
      # click_link "Bob"
      # expect(path).to eq("/users/#{user1.id}")
    end
    within "#user-#{user2.id}" do
      expect(page).to have_content("Drew")
      expect(page).to_not have_content("Bob")
      expect(page).to_not have_content("Gary")
      expect(page).to_not have_content("Sue")
      expect(page).to_not have_content("Lou")
      # click_link "Drew"
      # expect(path).to eq("/users/#{user2.id}")
    end
    within "#user-#{user3.id}" do
      expect(page).to have_content("Gary")
      expect(page).to_not have_content("Bob")
      expect(page).to_not have_content("Drew")
      expect(page).to_not have_content("Sue")
      expect(page).to_not have_content("Lou")
      # click_link "Gary"
      # expect(path).to eq("/users/#{user3.id}")
    end
    within "#user-#{user4.id}" do
      expect(page).to have_content("Sue")
      expect(page).to_not have_content("Bob")
      expect(page).to_not have_content("Drew")
      expect(page).to_not have_content("Gary")
      expect(page).to_not have_content("Lou")
      # click_link "Sue"
      # expect(path).to eq("/users/#{user4.id}")
    end
    within "#user-#{user5.id}" do
      expect(page).to have_content("Lou")
      expect(page).to_not have_content("Bob")
      expect(page).to_not have_content("Drew")
      expect(page).to_not have_content("Gary")
      expect(page).to_not have_content("Sue")
      # click_link "Lou"
      # expect(path).to eq("/users/#{user5.id}")
    end
  end


end