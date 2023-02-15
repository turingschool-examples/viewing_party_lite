require 'rails_helper'

RSpec.describe 'The Movie Results Index', type: :feature do
  let!(:user1) { User.create!(name: 'Brian', email: 'brian@test.com', password: 'password123', password_confirmation: 'password123') }
  let!(:user2) { User.create!(name: 'Peter', email: 'peter@test.com', password: 'password123', password_confirmation: 'password123') }
  let!(:user3) { User.create!(name: 'Chris', email: 'chris@test.com', password: 'password123', password_confirmation: 'password123') }
  let!(:user4) { User.create!(name: 'Meg', email: 'meg@test.com', password: 'password123', password_confirmation: 'password123') }
  let!(:user5) { User.create!(name: 'Anth', email: 'anth@test.com', password: 'password123', password_confirmation: 'password123') }
  let!(:user6) { User.create!(name: 'Thomas', email: 'thomas@test.com', password: 'password123', password_confirmation: 'password123') }
  
  describe 'the discover page button' do
    it 'takes a user back to their discover page' do
      stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key&language=en-US&limit=20").
      to_return(status: 200, body: File.read('spec/fixtures/top_rated_movies_response.json'), headers: {})

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)
      visit movies_path
      
      expect(page).to have_button("Discover Page")

      within("#discover-page-button") do
        click_button("Discover Page")
      end

      expect(current_path).to eq(discover_index_path)
    end
  end

  describe 'the display movie results area' do
    it 'will display the top 20 rated movies when button pressed' do
      stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key&language=en-US&limit=20").
      to_return(status: 200, body: File.read('spec/fixtures/top_rated_movies_response.json'), headers: {})

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)
      visit discover_index_path

      click_button("Top Rated Movies")

      expect(current_path).to eq(movies_path)

    end

    it 'will display the search results after a search has occurred' do
      stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key&query=star%20wars").
      to_return(status: 200, body: File.read('spec/fixtures/search_for_starwars.json'), headers: {})

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)
      visit discover_index_path

      fill_in :query, with: "star wars"
      click_button("Search")

      expect(current_path).to eq(movies_path)

      within("#display-movies") do
        expect(page).to have_content("Star Wars: The Rise of Skywalker")
        expect(page).to have_content("Star Wars: The Last Jedi")
        expect(page).to have_content("Star Wars: The Force Awakens")
      end
    end
  end
end