require 'rails_helper'
require 'faker'

RSpec.describe 'Discover Movies Page' do
  before(:each) do
    @user = User.create!(name: Faker::Name.unique.name, email: Faker::Internet.unique.free_email)

    visit "/users/#{@user.id}/discover"
  end

  describe 'index' do
    it 'has a link to discover top rated movies that links to movies results page' do
      expect(page).to have_link('Discover Top Rated Movies')
      json_response = File.read('spec/fixtures/top_rated_movies.json')
      stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV.fetch('tmdb_api_key', nil)}").to_return(
        status: 200, body: json_response
      )
      click_link('Discover Top Rated Movies')
      expect(current_path).to eq("/users/#{@user.id}/movies")
    end

    it 'has a search bar that links to movies results page' do
      json_response = File.read('spec/fixtures/search_up_movies.json')
      stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=#{ENV.fetch('tmdb_api_key', nil)}&language=en-US&query=Up&page=1&include_adult=false").to_return(
        status: 200, body: json_response
      )
      fill_in "search",	with: "Up"
      click_button 'Find Movies'

      # expect(page.status_code).to eq(200)
    end


  end

end
