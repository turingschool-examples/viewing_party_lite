require 'rails_helper'
require 'faker'

RSpec.describe 'TMDB Search' do
  before(:each) do
    @user = User.create!(name: Faker::Name.unique.name, email: Faker::Internet.unique.email)
  end

  describe 'happy path' do
    it 'allows users to search for top rated movies', :vcr do
      # json_response = File.read('spec/fixtures/top_rated_movies.json')
      # stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV.fetch('tmdb_api_key', nil)}").to_return(status: 200, body: json_response)
      visit user_discover_index_path(@user.id)
      click_link 'Discover Top Rated Movies'

      expect(page.status_code).to eq(200)
    end

  end

end
