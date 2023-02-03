require 'rails_helper'

RSpec.describe TMDBService do
  describe "get_top_rated_movies" do
    it 'can return 20 top rated movies' do
      stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated").to_return(status: 200, body: File.read('spec/fixtures/top_rated_movies.json'), headers: {})

      response = TMDBService.get_top_rated_movies

      expect(response).to have_key(:results)
      expect(response[:results]).to be_a(Array)
      expect(response[:results][0]).to have_key(:title)
      expect(response[:results][0]).to have_key(:vote_average)
    end
  end
end