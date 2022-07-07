require 'rails_helper'

RSpec.describe MoviesFacade do
  describe 'methods' do
    it 'returns a list of movies' do
      movies = MoviesFacade.get_top_rated_movies

      expect(movies).to be_all(Movie)
    end
  end
end
