# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'MovieFacade' do
  describe 'MovieFacade#top_40' do
    it 'makes a service call and returns an array of movie POROs', :vcr do
      movies = MovieFacade.top_40

      expect(movies).to be_a Array
      expect(movies.count).to eq(40)
      expect(movies).to be_all Movie
    end
  end

  describe 'search_by_keyword(keyword)' do
    it 'makes a service call and returns an array of movie POROs', :vcr do
      movies = MovieFacade.search_by_keyword('Fight Club')

      expect(movies).to be_a Array
      expect(movies.count).to be <= 40
      expect(movies).to be_all Movie
    end
  end

  describe 'find_movie(id)' do
    it 'makes a service call and returns a single movie PORO', :vcr do
      movie = MovieFacade.find_movie(550)

      expect(movie).to be_a Movie
      expect(movie.genre).to eq([{ id: 18, name: 'Drama' }])
      expect(movie.title).to eq('Fight Club')
      expect(movie.runtime).to eq(139)
      expect(movie.vote_average).to eq(8.4)
    end
  end

  describe 'find_cast(id)' do
    it 'makes a service call and returns a MovieCast PORO', :vcr do
      movie_cast = MovieFacade.find_cast(550)

      expect(movie_cast).to be_a Array
      expect(movie_cast.count).to eq(10)
      expect(movie_cast).to be_all MovieCast
    end
  end

  describe 'find_review(id)' do
    it 'makes a service call and returns an array of MovieReview POROs', :vcr do
      movie_review = MovieFacade.find_review(550)

      expect(movie_review).to be_a(Array)
      expect(movie_review).to be_all(MovieReview)
      expect(movie_review.first.author).to eq('Goddard')
      expect(movie_review.first.content).to eq('Pretty awesome movie.  It shows what one crazy person can convince other crazy people to do.  Everyone needs something to believe in.  I recommend Jesus Christ, but they want Tyler Durden.')
    end
  end
end
