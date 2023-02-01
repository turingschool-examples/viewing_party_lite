require 'rails_helper'

RSpec.describe MovieService do
  describe 'class methods' do
    before(:each) do
      @movie_service = MovieService.new
    end

    describe '#top_rated' do
      it 'returns top rated movies' do
        expect(@movie_service.top_rated).to be_a(Hash)
        expect(@movie_service.top_rated[:results]).to be_a(Array)
      end
    end

    describe '#movie' do
      it 'returns movie of specific id' do
        expect(@movie_service.movie(550)).to be_a(Hash)
        expect(@movie_service.movie(550)[:original_title]).to be_a(String)
      end
    end

    describe '#image' do
      it 'returns path of specific movie poster path' do
        expect(@movie_service.image("/3bhkrj58Vtu7enYsRolD1fZdja1.jpg")).to be_a(String)
        expect(@movie_service.image("/3bhkrj58Vtu7enYsRolD1fZdja1.jpg")).to include('https')
      end
    end
  end
end