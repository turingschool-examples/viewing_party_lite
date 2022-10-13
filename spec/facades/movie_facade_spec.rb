require 'rails_helper'

RSpec.describe MovieFacade do
  describe '#info_card' 
    it 'returns the correct data type' do
      VCR.use_cassette("fight_club_info_card", :allow_playback_repeats => true) do
        expect(MovieFacade.info_card(550)).to be_a(Hash)
        expect(MovieFacade.info_card(550).count).to eq(2)
      end
    end
  end

  describe '#popular' do
    it 'returns the correct data type' do
      VCR.use_cassette("popular", :allow_playback_repeats => true) do
        expect(MovieFacade.popular).to be_a(Array)
        expect(MovieFacade.popular.first).to be_a(Hash)
        expect(MovieFacade.popular.count).to eq(20)
      end
    end
  
end