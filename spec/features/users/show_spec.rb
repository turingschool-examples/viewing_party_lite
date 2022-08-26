require 'rails_helper'

RSpec.describe "User's Dashboard Show Page" do
  before do
    @user = User.create!(name: "#{Faker::TvShows::HowIMetYourMother.character}", email: "#{Faker::TvShows::HowIMetYourMother.character}@centuryfoxtv.com")

    visit "/users/#{@user.id}"
  end

  it "displays the user's name" do
    expect(page).to have_content("#{@user.name}'s Dashboard")
    expect(page).to_not have_content("Joanne's Dashboard")
  end

  it "can click a button to link to the user's movie discover page" do
    click_button "Discover Movies"

    expect(current_path).to eq("/users/#{@user.id}/discover")
  end

  it "lists all viewing parties the user is hosting or attending" do
    expect(page).to have_content("Viewing Parties")
    # expect(page).to have_content("<insert pic of movie and view party info>")
  end
end
