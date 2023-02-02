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

    describe '#cast' do
      it 'returns cast of specific movie' do
        expect(MovieService.cast(550)).to be_a(Hash)
        expect(MovieService.cast(550)[:cast]).to be_a(Array)
        expect(MovieService.cast(550)[:cast][0]).to have_key(:name)
        expect(MovieService.cast(550)[:cast][0][:name]).to be_a(String)
      end
    end

    describe '#reviews' do
      it 'returns reviews for a specific movie' do
        expect(MovieService.reviews(550)).to be_a(Hash)
        expect(MovieService.reviews(550)[:results]).to be_a(Array)
        expect(MovieService.reviews(550)[:results][0]).to have_key(:author)
        expect(MovieService.reviews(550)[:results][0][:author]).to be_a(String)
      end
    end
  end
end
