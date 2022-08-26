require 'rails_helper'

RSpec.describe 'MovieFacade' do

describe '#search_movies' do 
    it 'returns an array of movie objects' do 
        data = File.read('spec/fixtures/shawshank.json')
        parsed_data = JSON.parse(data, symbolize_names: true)

        allow(MovieService).to receive(:search_movies_by_title).and_return(parsed_data)

        movie = MovieFacade.search_movies("The Shawshank Redemption")

        expect(movie).to be_a(Movie)
    
    end 
  end 
end 
