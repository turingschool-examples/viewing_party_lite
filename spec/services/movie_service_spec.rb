require 'rails_helper'

RSpec.describe 'Movie Service' do
  describe 'class methods' do

    it '.top_rated_movies', :vcr do
      movies = MovieService.top_rated_movies

      expect(movies).to be_a(Hash)
      expect(movies[:results]).to be_an(Array)
      expect(movies[:results][0][:original_title]).to eq("The Shawshank Redemption")
    end

    it '.cast_members', :vcr do
      cast = MovieService.cast_members(345)
      expect(cast).to be_a(Hash)
      expect(cast[:cast]).to be_an(Array)
      expect(cast[:cast].first[:character]).to eq("Dr. William 'Bill' Harford")
      expect(cast[:cast].first[:name]).to eq("Tom Cruise")
    end

    it '.movie_details', :vcr do

      mov_details = MovieService.movie_details(278)
      expect(mov_details).to be_a(Hash)
      expect(mov_details[:overview]).to include("Framed in the 1940s")
      expect(mov_details[:genres][0][:name]).to eq("Drama")
      expect(mov_details[:runtime]).to eq(142)
      # expect(mov_details[:mov_details].first[:name]).to eq("Tom Cruise")
    end

    it '.reviews', :vcr do

      review = MovieService.reviews(278)
      expect(review).to be_a(Hash)
      expect(review[:results]).to be_an(Array)
      expect(review[:results].first[:author]).to eq("elshaarawy")
      expect(review[:results].first[:content]).to eq("very good movie 9.5/10 محمد الشعراوى")
    end

    it '.search_movies', :vcr do
      movies = MovieService.search_movies('shawshank')

      expect(movies[0][:original_title]).to eq('The Shawshank Redemption')
      expect(movies[0]).to be_a(Hash)
      expect(movies[0]).to have_key(:id)
      expect(movies[0]).to have_key(:overview)
      expect(movies[0]).to have_key(:vote_average)
    end
  end
end
