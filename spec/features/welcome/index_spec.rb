require 'rails_helper'

RSpec.describe "Landing Page" do
  it 'displays title of application' do
    visit '/'
    expect(page).to have_content("Viewing Party")
  end

  it 'has button that links to create new user' do
    visit '/'

    click_button("Create New User")
    expect(current_path).to eq('/register')
  end


  it 'displays name of user' do

    drew = User.create!(name: "Drew Proebstel", email: "swagmasterd@dopemail.com", password: 'password123', password_confirmation: 'password123')
    alex = User.create!(name: "Alex P", email: "swagmasterp@dopemail.com", password: 'password345', password_confirmation: 'password345')

    visit '/'


    expect(page).to have_content("Drew Proebstel")
    expect(page).to have_content("Alex P")

  end

  it 'links to users dashboard' do
    drew = User.create(name: "Drew Proebstel", email: "swagmasterd@dopemail.com", password: 'password345', password_confirmation: 'password345')
    visit '/'
    click_link("Drew Proebstel")
    expect(current_path).to eq("/users/#{drew.id}/dashboard")
  end

  it 'links to landing page' do
    visit '/'
    drew = User.create(name: "Drew Proebstel", email: "swagmasterd@dopemail.com")
    click_link("Landing Page")
    expect(current_path).to eq("/")
  end

  it 'has a link to login, when I click this link I am taken to login page' do
    user_1 = User.create!(name: 'user_1', email: 'test@emailtest.com', password: '1234', password_confirmation: '1234')

    visit root_path

    within '.login' do
      expect(page).to have_button("Login")
      click_button("Login")

      expect(current_path).to eq("/login")
    end
  end


end
