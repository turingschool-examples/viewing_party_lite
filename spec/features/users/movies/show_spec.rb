require 'rails_helper'

RSpec.describe 'Movies Show page', type: :feature do
  let!(:users) { create_list(:user, 3)}
  let!(:viewing_party) { create(:viewing_party)}

  it 'has a button to create a viewing party', :vcr do
    visit user_movie_path(users[0].id, 278)
    click_button 'Create Viewing Party'
    expect(current_path).to eq("/users/#{users[0].id}/movies/278/viewing_partys/new")
  end

  it 'has a button to return to the discover page', :vcr do
    visit user_movie_path(users[0].id, 278 )

    click_button 'Discover Page'
    expect(current_path).to eq(user_discover_path(users[0].id))
  end

  it "can display movie attributes", :vcr do
    visit user_movie_path(users[0].id, 278 )

    within "#movie-overview" do
      expect(page).to have_content("Vote Average: 8.7")
      expect(page).to have_content("Runtime: 2:22")
      expect(page).to have_content("Genre(s): Drama | Crime |")
      expect(page).to have_content("Movie Summary")
    end

    within "#cast-members" do
      expect(page).to have_content("Tim Robbins as Andy Dufresne")
      expect(page).to have_content("Larry Brandenburg as Skeet")
      expect(page).to_not have_content("Neil Giuntoli as Jigger")
    end

    within "#reviews" do
      expect(page).to have_content("7 Reviews")
      expect(page).to have_content("Author: elshaarawy, Rating: 9.0")
      expect(page).to have_content("Author: thommo_nz, Rating: 10.0")
    end
  end
end
