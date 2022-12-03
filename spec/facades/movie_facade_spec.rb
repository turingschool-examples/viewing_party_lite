require 'rails_helper'

RSpec.describe MovieFacade, :vcr do
  describe '#movie_card' do
    it '- creates a new movie poro' do
      movie_details = MovieService.movie_details(550)
      movie_reviews = MovieService.movie_reviews(550)
      movie_credits = MovieService.movie_credits(550) 
      expect(MovieFacade.new_movie_details(550)).to be_a(Movie)
    end
  end
  describe '#top_rated' do
    it '- creates a new movie poro' do
      movie_details = MovieService.movie_details(550)
      movie_reviews = MovieService.movie_reviews(550)
      movie_credits = MovieService.movie_credits(550) 
      expect(MovieFacade.new_movie_details(550)).to be_a(Movie)
    end
  end
  describe '#search' do
    it '- creates a new movie poro' do
      movie_details = MovieService.movie_details(550)
      movie_reviews = MovieService.movie_reviews(550)
      movie_credits = MovieService.movie_credits(550) 
      expect(MovieFacade.new_movie_details(550)).to be_a(Movie)
    end
  end
end