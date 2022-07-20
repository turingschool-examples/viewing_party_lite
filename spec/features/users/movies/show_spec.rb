require 'rails_helper'

RSpec.describe 'Movies Show page', type: :feature do
  let!(:users) { create_list(:user, 3)}
  let!(:viewing_party) { create(:viewing_party)}
  let!(:bob) { User.create(user_name: 'Bob', email: 'Bob@gmail.com', password: 'blob', password_confirmation: 'blob') }

  before :each do
    visit login_path
    fill_in :email, with: 'Bob@gmail.com'
    fill_in :password, with: 'blob'
    click_on 'Log In'
  end

  it 'has a button to create a viewing party', :vcr do
    visit movie_path(278)
    click_button 'Create Viewing Party'
    expect(current_path).to eq(new_movie_viewing_party_path(278))
  end

  it 'has a button to return to the discover page', :vcr do
    visit movie_path(278)

    click_button 'Discover Page'
    expect(current_path).to eq(discover_path)
  end

  it "can display movie attributes", :vcr do
    visit movie_path(278)

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
