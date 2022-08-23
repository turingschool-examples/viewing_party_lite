require 'rails_helper'

RSpec.describe "User's Dashboard Show Page" do
  before do
    visit "/register"
    
    user1 = User.create!(name: "#{Faker::TvShows::HowIMetYourMother.character}", email: "#{Faker::TvShows::HowIMetYourMother.character}@centuryfoxtv.com")

    visit "/users/#{user1.id}"
  end

  it "displays a user's name and email" do
    expect(page).to have_content("#{user1.name}'s Dashboard")
    expect(page).to have_content("#{user1.email}'s Dashboard")
  end

  
end