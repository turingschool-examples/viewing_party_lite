require 'rails_helper'
require 'faker'

RSpec.describe 'Movies Index Page' do
  before(:each) do
    @user = User.create!(name: Faker::Name.unique.name, email: Faker::Internet.unique.free_email)

  end

  describe 'index' do
    it 'has movie names that are links to show page', :vcr do
      visit "/users/#{@user.id}/discover"
      expect(page).to have_link('Discover Top Rated Movies')
      # json_response = File.read('spec/fixtures/top_rated_movies.json')
      # stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV.fetch('tmdb_api_key', nil)}").to_return(
      #   status: 200, body: json_response
      # )
      click_link('Discover Top Rated Movies')
      expect(current_path).to eq("/users/#{@user.id}/movies")
      expect(page).to have_link('The Godfather')
      # json_response = File.read('spec/fixtures/godfather_movie.json')
      # stub_request(:get, "https://api.themoviedb.org/3/movie/238?api_key=#{ENV.fetch('tmdb_api_key', nil)}&language=en-US").to_return(
      #   status: 200, body: json_response
      # )
      click_link 'The Godfather'
      expect(current_path).to eq(user_movie_path(@user.id, 238))
    end

  end
end
