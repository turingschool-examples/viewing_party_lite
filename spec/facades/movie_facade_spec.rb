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
  end
end
