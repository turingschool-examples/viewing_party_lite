require 'rails_helper'

RSpec.describe MovieFacade do
  describe "top rated movies" do
    it "can create movies objects based on query results", :vcr do
      lots_of_movies = MovieFacade.movie_results("top_rated")
      movie_by_name = MovieFacade.movie_results("shawshank")

      expect(lots_of_movies).to be_a Array
      expect(lots_of_movies).to be_all Movie

      expect(movie_by_name).to be_a Array
      expect(movie_by_name.length).to eq 3 # there are 3 movies with "Shawshank" in the title
      expect(movie_by_name[0].data[:title]).to eq "The Shawshank Redemption"
    end
  end
end
