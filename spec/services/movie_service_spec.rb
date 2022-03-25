require 'rails_helper'

RSpec.describe MovieService do
  context 'class methods' do
    context '#top_rated' do
      it 'returns top rated movies', :vcr do
        search = MovieService.top_rated
        expect(search).to be_a Hash
        expect(search[:results]).to be_an Array
        movie_data = search[:results].first

        expect(movie_data).to have_key(:id)
        expect(movie_data[:id]).to be_a(Integer)

        expect(movie_data).to have_key(:title)
        expect(movie_data[:title]).to be_a(String)

        expect(movie_data[:runtime]).to be(nil)

        expect(movie_data).to have_key(:vote_average)
        expect(movie_data[:vote_average]).to be_a(Float)
      end
    end
    context '#movie_title_search(query)' do
      it 'returns movies based on title provided from user', :vcr do
        search = MovieService.movie_title_search("Avengers")
        expect(search).to be_a Hash
        expect(search[:results]).to be_an Array
        movie_data = search[:results].first

        expect(movie_data).to have_key(:id)
        expect(movie_data[:id]).to be_a(Integer)

        expect(movie_data).to have_key(:title)
        expect(movie_data[:title]).to be_a(String)

        expect(movie_data[:runtime]).to be(nil)

        expect(movie_data).to have_key(:vote_average)
        expect(movie_data[:vote_average]).to be_a(Float)
      end
    end
    context '#movie_id_search(id)' do
      it 'returns a single movie based on id', :vcr do
        search = MovieService.movie_id_search(111)
        expect(search).to be_a Hash
        movie_data = search

        expect(movie_data).to have_key(:id)
        expect(movie_data[:id]).to be_a(Integer)

        expect(movie_data).to have_key(:title)
        expect(movie_data[:title]).to be_a(String)

        expect(movie_data[:runtime]).to be(170)

        expect(movie_data).to have_key(:vote_average)
        expect(movie_data[:vote_average]).to be_a(Float)

        expect(movie_data).to have_key(:genres)
        expect(movie_data[:genres]).to be_an(Array)

        expect(movie_data).to have_key(:overview)
        expect(movie_data[:overview]).to be_a(String)
      end
    end
  end
end
