require 'rails_helper'

RSpec.describe 'Discover Index Page', type: :feature do
  let!(:user1) { User.create!(name: 'Brian', email: 'brian@test.com', password: 'password123', password_confirmation: 'password123') }
  let!(:user2) { User.create!(name: 'Peter', email: 'peter@test.com', password: 'password123', password_confirmation: 'password123') }
  let!(:user3) { User.create!(name: 'Chris', email: 'chris@test.com', password: 'password123', password_confirmation: 'password123') }
  let!(:user4) { User.create!(name: 'Meg', email: 'meg@test.com', password: 'password123', password_confirmation: 'password123') }
  let!(:user5) { User.create!(name: 'Anth', email: 'anth@test.com', password: 'password123', password_confirmation: 'password123') }
  let!(:user6) { User.create!(name: 'Thomas', email: 'thomas@test.com', password: 'password123', password_confirmation: 'password123') }

  describe "the default basics" do
    it 'has a title' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)
      visit discover_index_path

      expect(page).to have_content("#{user1.name}'s Discover Movies Page")
    end
  end

  describe 'Top Rated Movies Search Button' do
    it 'has a button that will display the top rated movies' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)
      visit discover_index_path

      expect(page).to have_button("Top Rated Movies")
    end

    it 'brings you to the movie results page and displays the top rated movies' do
      stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key&language=en-US&limit=20").
      to_return(status: 200, body: File.read('spec/fixtures/top_rated_movies_response.json'), headers: {})

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)
      visit discover_index_path

      click_button "Top Rated Movies"
      expect(current_path).to eq(movies_path)
    end
  end

  describe 'Movie Search by Title Field and Button' do
    it 'has a field to type movies into and a button to search for those movies' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)
      visit discover_index_path

      expect(page).to have_field(:query)
      expect(page).to have_button("Search")
    end
  end
end