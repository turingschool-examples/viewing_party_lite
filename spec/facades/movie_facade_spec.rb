require 'rails_helper'
RSpec.describe MovieFacade do
  describe 'class methods' do
    describe '#top_rated_movies' do
      it 'will return the top rated movies' do
        top_movie_objects = MovieFacade.top_rated_movies
        top_movie_objects.each do |object|
          expect(object).to be_a TopMovie
          expect(object.title).to_not be_nil
          expect(object.vote).to_not be_nil
        end
      end
    end
    describe '#movie_details' do
      it 'will return a specific movie review' do
        movie_details = MovieFacade.movie_details(19_404)
        expect(movie_details).to be_a MovieDetail
        expect(movie_details.title).to_not be_nil
        expect(movie_details.runtime).to_not be_nil
        expect(movie_details.all_genere_names).to_not be_nil
        expect(movie_details.vote).to_not be_nil
        expect(movie_details.summary).to_not be_nil
      end
    end
  end
  describe '#movie_reviews' do
    it 'will return a specific movie review' do
      movie_objects = MovieFacade.movie_reviews(19_404)
      movie_objects.each do |object|
        expect(object).to be_a MovieReview
        expect(object.author).to_not be_nil
        expect(object.content).to_not be_nil
      end
    end
  end
  describe '#movie_credits' do
    it 'will return the cast of a movie' do
      credit_objects = MovieFacade.movie_credit(19_404)
      credit_objects.each do |object|
        expect(object).to be_a MovieCredit
        expect(object.name).to_not be_nil
        expect(object.character).to_not be_nil
      end
    end
  end
  describe '#movie_search' do
    it 'will return top results of what you search' do
      credit_objects = MovieFacade.movie_search('Marvel')
      credit_objects.each do |object|
        expect(object).to be_a MovieSearch
        expect(object.title).to_not be_nil
        expect(object.vote).to_not be_nil
      end
    end
  end
end
