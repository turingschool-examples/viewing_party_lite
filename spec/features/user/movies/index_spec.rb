require 'rails_helper'

RSpec.describe "User Movie Results Page", type: :feature do
  before :each do
    @user1 = User.create!(name: 'Sai', email: 'SaiLent@overlord.com')
    @user2 = User.create!(name: 'Parker', email: 'GriffithDidNothing@Wrong.com')
  end
  describe 'discover movie button' do
    it 'shows movie title and vote average when query is top 20', :vcr do
      visit "/users/#{@user2.id}/discover"

      click_button("Discover Top Rated Movies")

      expect(page.all(".movie").count).to eq(20)
    end

    it 'has links that are movie titles', :vcr do
      visit "/users/#{@user2.id}/discover"

      click_button("Discover Top Rated Movies")

      expect(page).to have_link("The Godfather")
    end

    it 'has movie title links that lead to the correct path', :vcr do
      visit "/users/#{@user2.id}/discover"

      click_button("Discover Top Rated Movies")

      click_link("The Godfather")

      expect(page).to have_current_path("/users/#{@user2.id}/movies/238")
    end
    it 'has the correct page title', :vcr do
      visit "/users/#{@user2.id}/discover"

      click_button("Discover Top Rated Movies")

      expect(page).to have_content("Top Rated Movies")
    end
  end
  describe 'search bar' do
    it 'returns matches and partial matches based off entered keyword', :vcr do
      visit "/users/#{@user2.id}/discover"

      fill_in(:q, with: 'castle')
      click_button("Search by Movie Title")

      expect(page).to have_content('Castle Freak')
      expect(page).to have_content('Winter Castle')
      expect(page).to have_content('The Glass Castle')
      expect(page).to_not have_content('The Godfather')
    end

    it 'has the correct page title', :vcr do
      visit "/users/#{@user2.id}/discover"

      fill_in(:q, with: 'castle')
      click_button("Search by Movie Title")

      expect(page).to have_content("Movie results for: castle")
    end
  end
end
