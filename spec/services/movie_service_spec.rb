require 'rails_helper'

describe MovieService, :vcr do
    context "#movie_data" do
        it "returns movie data for a specific movie", :vcr do
            movie = MovieService.movie_data(278)
             
            expect(movie).to be_a Hash

            expect(movie).to have_key :title
            expect(movie[:title]).to be_a(String)

            expect(movie).to have_key :poster_path
            expect(movie[:poster_path]).to be_a(String)

            expect(movie).to have_key :overview
            expect(movie[:overview]).to be_a(String)

            expect(movie).to have_key :genres
            expect(movie[:genres]).to be_a(Array)

            expect(movie).to have_key :vote_average
            expect(movie[:vote_average]).to be_a(Float)
        end

        it "returns cast data for a specific movie", :vcr do
            movie = MovieService.cast_data(278)
             
            expect(movie).to be_a Hash

            expect(movie).to have_key :cast
            expect(movie[:cast]).to be_a(Array)

            cast = movie[:cast].first

            expect(movie[:cast].first).to be_a Hash

            expect(movie[:cast].first).to have_key :name
            expect(movie[:cast].first[:name]).to be_a(String)

            expect(movie[:cast].first).to have_key :character
            expect(movie[:cast].first[:character]).to be_a(String)
        end

        it 'returns review data for a specific movie', :vcr do
            movie = MovieService.review_data(278)

            expect(movie).to be_a Hash

            expect(movie).to have_key :results

            expect(movie[:results]).to be_a(Array)

            review = movie[:results].first

            expect(review).to be_a Hash

            expect(review).to include :author, :content

            expect(review[:author]).to be_a String

            expect(review[:content]).to be_a String
        end

        it 'returns movie search data for a given search string', :vcr do
            movies = MovieService.movie_search("The Godfather")

            expect(movies).to be_a Array

            movie1 = movies.first

            expect(movie1).to be_a Hash

            expect(movie1).to include :title, :vote_average

            expect(movie1[:title]).to be_a String

            expect(movie1[:vote_average]).to be_a Float
        end
    end
end