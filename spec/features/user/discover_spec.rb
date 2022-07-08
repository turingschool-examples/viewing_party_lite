require 'rails_helper'

RSpec.describe "The User's Discover Movies Page", type: :feature do
    it 'has VPL title and discover movies at the top' do
    user = User.create!(name: "Rand", email: "randalthor@gmail.com")

    visit "/users/#{user.id}"
    click_button "Discover Movies"

    expect(current_path).to eq("/users/#{user.id}/discover")
    expect(page).to have_content("Viewing Party Lite")
    expect(page).to have_content("Discover Movies")
  end

  it 'has a button that returns top rated movies' do
    user = User.create!(name: "Rand", email: "randalthor@gmail.com")

    visit "/users/#{user.id}/discover"

    click_button "Find Top Rated Movies"
  end

  xit 'has a search field based on keyword' do
    user = User.create!(name: "Rand", email: "randalthor@gmail.com")

    visit "/users/#{user.id}/discover"

    fill_in :search, with: "Fight"
    click_button "Find Movies"

    expect(page).to have_content("Fight Club")
  end
end
