require 'rails_helper'

RSpec.describe 'Creating a new party:', type: :feature do
  before(:each)   do
    @user1 = User.create!(name: "Bliffert Blankship", email: "Bliff@aol.com", password: "12345", password_confirmation:"12345")
    @user2 = User.create!(name: "Blankert Bliffship", email: "Blank@aol.com", password: "12345", password_confirmation:"12345")
    @user3 = User.create!(name: "Blert Bliip", email: "Bnk@aol.com", password: "12345", password_confirmation:"12345")
    @user4 = User.create!(name: "Banker Biffshi", email: "Bla@aol.com", password: "12345", password_confirmation:"12345")
    visit '/login'
    fill_in("Name", with: "Bliffert Blankship")
    fill_in("Email", with: "Bliff@aol.com")
    fill_in("password", with:"12345")
    click_button("Log in")
  end

  it "has the party stufffffff on the page", :vcr do
    VCR.use_cassette('stuffff', :record => :new_episodes) do
    visit "/users/#{@user1.id}/movies/5244/parties/new"

    save_and_open_page
    expect(page).to have_content("Duration")
    expect(page).to have_content("Date")
    expect(page).to have_content("Start")
    expect(page).to have_button("Create Party")
    end
  end

  it "lists all 4 users to invite", :vcr do
    VCR.use_cassette('4 users', :record => :new_episodes) do
    visit "/users/#{@user1.id}/movies/5244/parties/new"
    expect(page).to have_content(@user1.name)
    expect(page).to have_content(@user2.name)
    expect(page).to have_content(@user3.name)
    expect(page).to have_content(@user4.name)
    end
  end


end
