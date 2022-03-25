require 'rails_helper'

RSpec.describe MovieFacade do
  describe 'class methods' do
    it 'creates movie poros for top rated movies' do
      movies = MovieFacade.find_top_rated_movies

      expect(movies).to be_an(Array)

      movies.each do |movie|
        expect(movie).to be_a(Movie)
      end
    end

    it 'searches for a movie given a keyword' do
      search = MovieFacade.search("shawsha")
      expect(search[0]).to be_an(Movie)
      expect(search[0].title).to eq("The Shawshank Redemption")
      expect(search[0].vote_average).to eq(8.7)
      expect(search.length).to eq(3)
    end

    it 'creates cast member poros' do
      cast_members = MovieFacade.cast_members(278)

      expect(cast_members).to be_an(Array)
      expect(cast_members.length).to eq(10)
    end
  end
end
