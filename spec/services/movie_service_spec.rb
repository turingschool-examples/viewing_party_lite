require 'rails_helper'

RSpec.describe MovieService do
  describe 'returns a movie by ID' do

    it '#movie_by_id' do

      VCR.use_cassette('fight_club') do
        fight_club = MovieService.movie_by_id(550)

        expect(fight_club).to be_a(Hash)
        expect(fight_club).to have_key(:original_title)
        expect(fight_club).to have_key(:poster_path)
      end
    end
  end

  describe 'returns top 20 top-rated movies' do

    it '#top_rated_movies' do

      VCR.use_cassette('top_rated_movies') do
        top_rated_movies = MovieService.top_rated_movies

        # expect(top_rated_movies.status_code).to eq(200)
        expect(top_rated_movies).to be_a(Hash)
        expect(top_rated_movies).to have_key(:results)
        expect(top_rated_movies).to have_key(:page)
        expect(top_rated_movies[:results]).to be_a(Array)


      end
    end
  end

  describe 'returns movies from keyword' do

    it '#movie_search' do

      VCR.use_cassette('search_movies') do
        movie_term = "Jack"
        search_movies = MovieService.movie_search(movie_term)

        expect(search_movies).to be_a(Hash)
        expect(search_movies).to have_key(:results)
        expect(search_movies).to have_key(:page)
        expect(search_movies[:results]).to be_a(Array)


      end
    end
  end
end
