require "rails_helper"

RSpec.describe MovieIndexResult do
    it "exists" do
        data = {
            id: 12,
            title: "King Kong",
            vote_average: 6.6
        }
    
        movie = MovieIndexResult.new(data)

        expect(movie).to be_a MovieIndexResult
        expect(movie.id).to eq(12)
        expect(movie.title).to eq("King Kong")
        expect(movie.vote_average).to eq(6.6)
    end 
end 

