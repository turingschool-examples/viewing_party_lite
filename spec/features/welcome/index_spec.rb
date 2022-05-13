require 'rails_helper'

RSpec.describe "Landing Page" do
  it 'displays title of application' do
    visit '/'
    expect(page).to have_content("Viewing Party")
  end

  it 'has button that links to create new user' do
    visit '/'

    click_button("Create New User")
  end


  it 'displays name of user' do

    drew = User.create!(name: "Drew Proebstel", email: "swagmasterd@dopemail.com")
    alex = User.create!(name: "Alex P", email: "swagmasterp@dopemail.com")

    visit '/'


    expect(page).to have_content("Drew Proebstel")
    expect(page).to have_content("Alex P")

  end

  it 'links to users dashboard' do
    drew = User.create(name: "Drew Proebstel", email: "swagmasterd@dopemail.com")
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


end
