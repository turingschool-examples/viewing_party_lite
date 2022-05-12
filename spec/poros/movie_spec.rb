require 'rails_helper'

RSpec.describe 'Movie' do 
    it 'creates a movie object with attributes' do 
        data = {
            original_title: 'frank',
            vote_average: 6.5
        }

        movie = Movie.new(data)
        expect(movie).to be_a(Movie)
        expect(movie.title).to eq("frank")
        expect(movie.vote_average).to eq(6.5)
    end
end