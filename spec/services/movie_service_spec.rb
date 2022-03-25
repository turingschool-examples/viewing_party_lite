require 'rails_helper'

RSpec.describe MovieService do
  context 'class methods' do
    context '#get_top_movie' do

      it 'returns top rated movies' do

        response = MovieService.get_top_movie

        expect(response).to be_an(Array)

        first_movie_data = response.first

        expect(first_movie_data).to have_key(:title)
        expect(first_movie_data[:title]).to be_a(String)

        expect(first_movie_data).to have_key :id
        expect(first_movie_data[:id]).to be_a(Integer)
      end

    end

    context '#get_search_movie' do

      it "returns a list to a search query" do

        response = MovieService.get_search_movie('the')

        expect(response).to be_an(Array)

        first_movie_data = response.first

        expect(first_movie_data).to have_key(:title)
        expect(first_movie_data[:title]).to be_a(String)

        expect(first_movie_data).to have_key :id
        expect(first_movie_data[:id]).to be_a(Integer)
      end
    end
  end
end
