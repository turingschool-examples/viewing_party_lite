require 'rails_helper'

RSpec.describe 'MovieFacade' do
  describe 'top_20_rated' do
    it 'retieves the top 20 movies from the API' do
      movies = MovieFacade.top_20_rated

      expect(movies).to be_a Array
      expect(movies).to be_all Movie
    end
  end

  # describe 'search' do
  #   it 'searches for movies by the keyword from the API' do
  #     movies = MovieFacade.search
  #     expect(movies).to be_a Array
  #     expect(movies).to be_all Movie
  #   end
  # end
end
