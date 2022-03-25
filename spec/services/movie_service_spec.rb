require 'rails_helper'

RSpec.describe MovieService do
  context 'class methods' do
    context '#top_rated' do

      it 'returns top rated movies' do


        movie = MovieService.new
        binding.pry
        movies = movie.top_rated

        movie_data = movies.first

        expect(movies).to be_a(Array)
        expect(movie_data).to have_key(:title)
        expect(movie_data[:title]).to be_a(string)
        expect(movie_data).to have_key(:id)
        expect(movie_data[:id]).to be_a(string)
        expect(movie_data).to have_key(:vote_average)
        expect(movie_data[:vote_average]).to be_a(string)
      end
    end
  end
end
