require 'rails_helper'

RSpec.describe MovieService do
  describe 'class methods' do
    describe '#top_rated' do
      it 'returns top rated movies' do
        expect(MovieService.top_rated).to be_a(Hash)
        expect(MovieService.top_rated[:results]).to be_a(Array)
      end
    end

    describe '#movie' do
      it 'returns movie of specific id' do
        expect(MovieService.movie(550)).to be_a(Hash)
        expect(MovieService.movie(550)[:original_title]).to be_a(String)
      end
    end

    describe '#image' do
      it 'returns path of specific movie poster path' do
        expect(MovieService.image("/3bhkrj58Vtu7enYsRolD1fZdja1.jpg")).to be_a(String)
        expect(MovieService.image("/3bhkrj58Vtu7enYsRolD1fZdja1.jpg")).to include('https')
      end
    end
  end
end