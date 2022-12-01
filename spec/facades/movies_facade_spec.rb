require 'rails_helper'

RSpec.describe MoviesFacade do 
  describe 'class methods' do 
    describe '#top_rated' do 
      it 'returns movie objects based on top rated api call' do 
        VCR.use_cassette('top_rated_movies') do 
          movies = MoviesFacade.top_rated

          expect(movies.length).to be <= 20

          movies.each do |movie|
            expect(movie).to be_a MovieLite
            expect(movie.movie_title).to be_a String
          end
        end
      end 
    end

    describe '#search' do 
      it 'returns movie objects based on search api call' do 
        VCR.use_cassette('search_godfather') do 
          movies = MoviesFacade.search('godfather')

          expect(movies.length).to be <= 20

          movies.each do |movie|
            expect(movie).to be_a MovieLite
            expect(movie.movie_title).to be_a String
          end
        end
      end 
    end
  end
end