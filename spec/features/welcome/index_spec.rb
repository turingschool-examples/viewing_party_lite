require 'rails_helper'

RSpec.describe "Landing Page" do
  xit 'displays title of application' do
    visit '/'
    expect(page).to have_content("Viewing Party")
  end

  it 'displays title of application' do
    visit '/'

    click_button("Create new Button")
  end


  it 'displays name of user' do

    drew = User.create(name: "Drew Proebstel", email: "swagmasterd@dopemail.com", password_digest: "@Rush2112" )
    alex = User.create(name: "Alex Peepee", email: "swagmasterp@dopemail.com", password_digest: "@Rush2112" )

    visit '/'


    expect(page).to have_content("Drew Proebstel")
    expect(page).to have_content("Alex P")

  end

  it 'links to users dashboard' do
    drew = User.create(name: "Drew Proebstel", email: "swagmasterd@dopemail.com", password_digest: "@Rush2112" )
    visit '/'
    click_link("Drew Proebstel")
    expect(current_path).to eq("/users/#{drew.id}")
  end

  it 'links to landing page' do
    visit '/'
    drew = User.create(name: "Drew Proebstel", email: "swagmasterd@dopemail.com", password_digest: "@Rush2112" )
    click_link("Landing Page")
    expect(current_path).to eq("/")
  end


end
