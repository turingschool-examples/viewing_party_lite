require 'rails_helper'

RSpec.describe 'Discover Movies View Page' do
    describe 'happy path' do
        it 'allows user to search for movies' do
            json_response = File.open("spec/fixtures/shawshank.json")
            stub_request(:get, "https://www.themoviedb.org/3/search/movie?api_key=#{ENV['moviedb_api_key']}&query=").to_return(status: 200, body: json_response)

            user_1 = User.create!(name: "Bryan", email: "bryan@bryan.com")

            visit "/users/#{user_1.id}/discover"

            fill_in :movie_search, with: "The Shawshank Redemption"
            click_button 'Search'

           expect(current_path).to eq "users/#{user_1.id}/movies"
        end
    end
    it "has a button to the top rated movies" do
      json_response = File.open("spec/fixtures/top_rated.json")
      stub_request(:get, "https://www.themoviedb.org/3/movie/top_rated?api_key=#{ENV['moviedb_api_key']}").to_return(status: 200, body: json_response)

      user_1 = User.create!(name: "Bryan", email: "bryan@bryan.com")

      visit "/users/#{user_1.id}/discover"

      click_button "Find Top Rated Movies"

      expect(current_path).to eq("/users/#{user_1.id}/movies")
    end
end
