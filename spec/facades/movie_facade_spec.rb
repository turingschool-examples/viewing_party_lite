# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MovieFacade do
  describe 'class methods' do
    describe '#top_rated_movies' do
      it 'returns the top 40 movies', :vcr do
        top_movies = MovieFacade.top_rated_movies

        expect(top_movies.length).to eq(40)
        expect(top_movies).to be_all(Movie)
        
        
      end
    end
    
    describe '#search' do
      it 'returns 40 movies that include the keyword in the title', :vcr do
        search_results = MovieFacade.search("cat")
        
        expect(search_results.length).to eq(40)
        expect(search_results).to be_all(Movie)
      end
    end
  end
end
