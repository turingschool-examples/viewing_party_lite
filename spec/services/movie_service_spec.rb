require 'rails_helper'
RSpec.describe MovieService do
  context 'class methods' do
    context '#top_rated_movies' do
      it 'returns top_rated_movies' do
        search = MovieService.get_top_rated_movies
        expect(search).to be_a Hash
        expect(search[:results]).to be_a Array
      end
    end

    context '#movie_details' do
      it 'returns movie_details' do
        search = MovieService.get_movie_details(19404)
        expect(search).to be_a Hash
        expect(search[:genres]).to be_a Array
        expect(search[:runtime]).to be_a Integer
      end
    end

    context '#movie_reviews' do
      it 'returns movie reviews' do
        search = MovieService.get_movie_reviews(19404)
        expect(search).to be_a Hash
        expect(search[:results]).to be_a Array
      end
    end

    context '#movie_credits' do
      it 'returns movie_credits' do
        search = MovieService.get_movie_credits(19404)
        expect(search).to be_a Hash
        expect(search[:cast]).to be_a Array
      end
    end

    context '#movie_search' do
      it 'returns searched' do
        search = MovieService.get_search_movies("marvel")
        expect(search).to be_a Hash
        expect(search[:results]).to be_a Array
      end
    end
  end
end
