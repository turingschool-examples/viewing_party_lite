require 'rails_helper'

RSpec.describe MovieFacade do
  describe '::top_rated' do
    it 'maps a response from the MovieService' do
      movies = MovieFacade.create_top_movies

      expect(movies).to be_an Array
      expect(movies).to be_all Movie
    end
  end

  describe '::cast' do
    it 'returns first 10 cast members' do
      movies = MovieFacade.create_cast(550)

      expect(movies).to be_an(Array)

      expect(movies.count).to eq(10)
      expect(movies[0]).to be_a(String)
      expect(movies[0]).to eq("The Narrator, played by Edward Norton")
    end
  end

  describe '::reviews' do
    it 'returns each reviews author and info' do
      movies = MovieFacade.create_reviews(550)

      expect(movies).to be_an(Array)

      expect(movies[0]).to eq("Goddard: Pretty awesome movie.  It shows what one crazy person can convince other crazy people to do.  Everyone needs something to believe in.  I recommend Jesus Christ, but they want Tyler Durden.")
    end
  end
end
