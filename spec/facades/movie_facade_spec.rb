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

  describe 'singular objects from api pull' do
    it "creates a singular movie from an id", :vcr do
      movie = MovieFacade.create_single_movie(278)

      expect(movie).to be_a Movie
    end

    it "creates a cast list from the credits", :vcr do
      movie = MovieFacade.create_single_movie_credits(278)

      expect(movie).to be_a Movie
      expect(movie.cast.length).to eq 61
    end

    it "can acquire movie reviews", :vcr do
      movie = MovieFacade.create_single_movie_reviews(278)

      expect(movie).to be_a Movie
      expect(movie.reviews.length).to eq 7
    end

    it "creates an image object", :vcr do
      image = MovieFacade.create_single_movie_images(378)

      expect(image).to be_a Image
    end
  end
end
