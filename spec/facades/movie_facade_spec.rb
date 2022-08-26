require 'rails_helper'

RSpec.describe MovieFacade do
    it 'searches movies with matching keywords in title', :vcr do
        movie = MovieFacade.search_movies("Finding Nemo", 1)

        expect(movie).to be_a Array
        expect(movie).to be_all MoviePoros
        expect(movie.count).to eq(3)
        expect(movie[0].title).to eq("Finding Nemo")
        expect(movie[1].title).to eq("Children's Aquarium: Finding the Real Nemo & Dory")
        expect(movie[2].title).to eq("Finding Dory")
    end

    xit 'searches for top trending movies', :vcr do
        movie = MovieFacade.search_trending
        #require 'pry'; binding.pry 
        
    end
end