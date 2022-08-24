require 'rails_helper'

RSpec.describe 'Landing Page' do
  it "has the title of the application" do
    visit root_path

    expect(page).to have_content("Viewing Party Lite")
  end

  it "has a button to create a new user" do
    visit root_path

    click_button 'Create New User'
    expect(current_path).to eq('/register')
  end

  it "has a list of existing users" do
    ben = User.create!(name: "Ben", email: "benjsdev@gmail.com")
    brian = User.create!(name: "Brian", email: "bshearsdev@gmail.com")
    drew = User.create!(name: "Drew", email: "dmacdev@gmail.com")

    visit root_path

    expect(page).to have_content(ben.email)
    expect(page).to have_content(brian.email)
    expect(page).to have_content(drew.email)
  end

  it "existing users have a link to their dashboard" do
    ben = User.create!(name: "Ben", email: "benjsdev@gmail.com")
    brian = User.create!(name: "Brian", email: "bshearsdev@gmail.com")
    drew = User.create!(name: "Drew", email: "dmacdev@gmail.com")

    visit root_path

    click_on "#{ben.email}'s Dashboard"

    expect(current_path).to eq("/users/#{ben.id}")
    expect(current_path).to_not eq("/users/#{brian.id}")
  end

  it "has a link to the landing page" do
    visit root_path

    expect(page).to have_content("Return to Main Page")

    click_on "Return to Main Page"

    expect(current_path).to eq("/")
  end

end
