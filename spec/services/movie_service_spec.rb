require 'rails_helper'

RSpec.describe MovieService do
    it 'gets data from api', :vcr do
        movie = MovieService.movies("Finding Nemo", 1)
        #require pry, binding.pry
        expect(movie[:results][0]).to be_a(Hash)
        expect(movie[:results][0][:title]).to be_a(String)
    end
end