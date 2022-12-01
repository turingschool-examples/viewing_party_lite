require 'rails_helper'

RSpec.describe Movie do

    it 'populates Movie fields from JSON response' do 
        data = JSON.parse(File.read('./spec/fixtures/shawshank.json'), symbolize_names: true) 

        movie = Movie.new(data)

        expect(movie).to be_a Movie
        expect(movie.title).to eq(data[:original_title])
        expect(movie.vote_average).to eq(data[:vote_average])
    end 

end 