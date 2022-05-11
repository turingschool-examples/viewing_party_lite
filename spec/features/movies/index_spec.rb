require 'rails_helper'

RSpec.describe "discover movies page" do
  it "has a button to discover top rated movies" do
    user_1 = User.create!(name: "Twitch", email: "twitch@dogmail.com")
    visit "/users/#{user_1.id}/discover"

    click_link "Discover Top Rated Movies"
    expect(current_path).to eq("/users/#{user_1.id}/movies")
  end
  
  it "has a section to search by movie title" do
    user_1 = User.create!(name: "Twitch", email: "twitch@dogmail.com")
    visit "/users/#{user_1.id}/discover"
  
    expect(page).to have_field("Movie Title")
    fill_in "Movie Title", with: "Gabriel"
    click_button "Search by Movie Title"

    expect(page).to have_content("Gabriel's Inferno")
    expect(page).to have_content("Gabriel's Inferno: Part II")
    expect(page).to have_content("Gabriel's Inferno: Part III")
  end
end