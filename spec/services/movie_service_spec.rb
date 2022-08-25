require 'rails_helper'

describe MovieService, :vcr do
    context "#movie_data" do
        it "returns movie data for a specific movie" do
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
    end
end