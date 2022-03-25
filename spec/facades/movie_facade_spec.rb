require 'rails_helper'

RSpec.describe MovieFacade do
  describe "#methods" do
    describe '#get_movie' do
      it 'gets movie when passed api_id' do
        VCR.use_cassette('fight_club_api') do
          @movie = MovieFacade.get_movie('550')

          expect(@movie).to be_an_instance_of(MovieCall)
          expect(@movie.title).to eq("Fight Club")
        end
      end
    end
    describe '#top_twenty' do
      it 'gets top 20 rated movies' do
        VCR.use_cassette('top_20_api') do
          @movies = MovieFacade.top_twenty

          expect(@movies.first.title).to eq('The Shawshank Redemption')
          expect(@movies.count).to eq(20)
        end
      end
    end
    describe '#search' do
      it 'gets up top 40 movies that match search resutls' do
        VCR.use_cassette('fight_results_api') do
          @movies = MovieFacade.search('fight')

          expect(@movies.first.title).to eq('Fight Club')
          expect(@movies.count).to eq(21)
        end
      end
    end
  end
end
