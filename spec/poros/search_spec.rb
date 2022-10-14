# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Search do
  describe 'Search Poro', :vcr do
    before :each do
      @movie_array1 = MovieFacade.search_poro('Dark')
      @movie_array2 = MovieFacade.search_poro('Fight')
    end

    it 'instantiates' do
      @movie_array1.each do |movie|
        expect(movie).to be_a(Search)
      end
    end

    it 'returns an array of Search objects which contain name as string, id as integer, vote average as float' do
      expect(@movie_array1).to be_a(Array)

      @movie_array1.each do |movie|
        expect(movie.name).to be_a(String)
        expect(movie.id).to be_a(Integer)
        if movie.vote_average.is_a? Integer
          expect(movie.vote_average).to be_a(Integer)
        else
          expect(movie.vote_average).to be_a(Float)
        end
      end
    end

    it 'search results include keyword' do
      @movie_array1.each do |movie|
        expect(movie.name).to include('Dark')
      end

      @movie_array2.each do |movie|
        expect(movie.name).to include('Fight')
      end
    end
  end
end
