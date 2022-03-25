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
      search = MovieFacade.search("shawshank")
      expect(search).to be_an(Array)
      # require 'pry'; binding.pry
    end

    it 'creates cast member poros' do
      cast_members = MovieFacade.cast_members(278)

      expect(cast_members).to be_an(Hash)

      # cast_members.each do |cast_member| 
      #   expect(cast_member).to be_an_instance_of(CastMember)
      # end
    end
  end
end