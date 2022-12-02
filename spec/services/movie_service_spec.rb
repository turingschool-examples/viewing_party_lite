# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MovieService do
  it 'exists', :vcr do
    movie = MovieService.new

    expect(movie).to be_an_instance_of(MovieService)
  end

  describe 'Class Methods' do
    describe '#movie_by_id' do
      it 'returns a movie from a given id', :vcr do
        movie = MovieService.movie_by_id(11)

        expect(movie.class).to be Hash
        expect(movie).to have_key(:id)
        expect(movie).to have_key(:title)
        expect(movie).to have_key(:runtime)
        expect(movie).to have_key(:vote_average)
        expect(movie).to have_key(:poster_path)

        expect(movie[:id]).to eq(11)
        expect(movie[:title]).to eq('Star Wars')
        expect(movie[:runtime]).to eq(121)
        expect(movie[:vote_average].round(2)).to eq(8.21)
        expect(movie[:poster_path]).to eq('/6FfCtAuVAW8XJjZ7eWeLibRLWTw.jpg')
      end
    end

    describe '#movies_by_keyword' do
      it 'finds movies based on a given word argument', :vcr do
        movies = MovieService.movies_by_keyword('Spinal Tap')

        expect(movies.class).to be Hash
        expect(movies[:results].class).to be Array
        expect(movies[:results].first[:title].include?('This Is Spinal Tap')).to be true
        expect(movies[:total_results]).to eq(5)
      end
    end

    describe '#find_top_rated_movies' do
      it 'finds the 20 top rated movies', :vcr do
        movies = MovieService.find_top_rated_movies

        expect(movies.class).to be Hash
        expect(movies[:results].class).to be Array
        expect(movies[:results].count).to eq(20)
      end
    end

    describe '#first_ten_cast' do
      it 'finds the first 10 cast members of a movie', :vcr do
        movie_id = 11
        movie = MovieService.movie_by_id(movie_id)
        cast = MovieService.first_ten_cast(movie_id)

        expect(cast.count).to eq(10)
      end
    end

    describe '#movie_reviews' do
      it 'finds the reviews for a movie', :vcr do
        movie_id = 11
        movie = MovieService.movie_by_id(movie_id)
        reviews = MovieService.movie_reviews(movie_id)

        expect(reviews.count).to eq(4)
      end
    end
  end
end
