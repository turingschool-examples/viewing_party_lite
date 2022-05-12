require 'rails_helper'

RSpec.describe 'Movie results page' do
  describe 'As a user when I visit the Movie Results page top movies' do
    it 'displays the titles of the top rated movies as a link the movie details page' do
      user1 = User.create!(name: 'Will', email: '123@mail.com')
      user2 = User.create!(name: 'Craig', email: 'abc@mail.com')

      visit "/users/#{user1.id}/discover"
      click_button "Discover Top Rated Movies"
      click_button "Discover"
      click_button "Discover Top Rated Movies"
      click_link "The Shawshank Redemption"

      expect(current_path).to eq("/users/#{user1.id}/movies/278")
      expect(current_path).to_not eq("/users/#{user2.id}/movies/278")
    end

    it 'displays the vote average of the movie' do
      user1 = User.create!(name: 'Will', email: '123@mail.com')

      visit "/users/#{user1.id}/discover"
      click_button "Discover Top Rated Movies"

      within "#movie-278" do
        expect(page).to have_content("8.7")
      end
    end
  end
  describe 'Search for title by name' do
    it 'returns search results for movie title' do
      user1 = User.create!(name: 'Will', email: '123@mail.com')
      user2 = User.create!(name: 'Craig', email: 'abc@mail.com')

      visit "/users/#{user1.id}/discover"
      fill_in :q, with: 'Castaway'
      click_button "Search"

      within "#movie-52886" do
        expect(page).to have_content("6.4")
      end

      within "#movie-52886" do
        click_link "Castaway"
      end

      expect(current_path).to eq("/users/#{user1.id}/movies/52886")
      expect(current_path).to_not eq("/users/#{user2.id}/movies/52886")
    end
  end
end
