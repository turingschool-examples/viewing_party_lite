require 'rails_helper'

RSpec.describe MovieFacade do
  describe '#get_a_movie', :vcr do
    it 'returns a movie' do
      movies = MovieFacade.get_a_movie('batman')
      expect(movies.first.title).to eq('The Batman')
      expect(movies).to be_an(Array)
    end
  end

  describe '#find_top_40_movies' do
    xit 'returns top 40 movies' do
      movies = MovieFacade.find_top_40_movies
      expect(movies.first.title).to eq('Batman Begins')
    end
  end
end