require 'rails_helper'

RSpec.describe 'Discover Index Page', type: :feature do
  let!(:user1) { User.create!(name: "Anthony", email: "anthony@gmail.com") }

  describe "the default basics" do
    it 'has a title' do
      visit user_discover_index_path(user1)

      expect(page).to have_content("#{user1.name}'s Discover Movies Page")
    end
  end

  describe 'Top Rated Movies Search Button' do
    it 'has a button that will display the top rated movies' do
      visit user_discover_index_path(user1)

      expect(page).to have_button("Top Rated Movies")

    end

    it 'brings you to the movie results page and displays the top rated movies' do
      visit user_discover_index_path(user1)

      click_button "Top Rated Movies"
      expect(current_path).to eq(user_movies_path(user1))
    end
  end

  describe 'Movie Search by Title Field and Button' do
    it 'has a field to type movies into and a button to search for those movies' do
      visit user_discover_index_path(user1)

      expect(page).to have_field(:title)
      expect(page).to have_button("Search")
    end

    it 'will take me to the movies results page (index) when I fill in the field and click submit' do
      visit user_discover_index_path(user1)

      fill_in(:title, with: "Fight Club")
      click_button "Search"

      expect(current_path).to eq(user_movies_path(user1))
    end
  end
end