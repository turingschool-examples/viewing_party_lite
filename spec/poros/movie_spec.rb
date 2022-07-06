require "rails_helper"

RSpec.describe Movie do
    it 'exists' do
        attributes = {
            title: "Titanic",
            id: 1,
            vote_average: 9.1,
            runtime: 194
        }
        movie = Movie.new(attributes)
        
        expect(movie).to be_a Movie
        expect(movie.title).to eq("Titanic")
        expect(movie.id).to eq(1)
        expect(movie.vote_average).to eq(9.1)
        expect(movie.runtime).to eq(194)
    
    end
end