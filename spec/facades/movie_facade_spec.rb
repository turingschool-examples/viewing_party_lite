require 'rails_helper'

RSpec.describe MovieFacade do
  describe '#info_card' 
    it 'returns the correct data type' do
      VCR.use_cassette("fight_club_info_card", :allow_playback_repeats => true) do
        expect(MovieFacade.info_card(550)).to be_a(Hash)
        expect(MovieFacade.info_card(550).count).to eq(2) #is this ok to test for???
        expect(MovieFacade.info_card(550)).to have_key(:img_path)
        expect(MovieFacade.info_card(550)).to have_key(:title)
      end
    end
  end

  describe '#popular' do
    it 'returns the correct data type' do
      VCR.use_cassette("popular", :allow_playback_repeats => true) do
        expect(MovieFacade.popular).to be_a(Array)
        expect(MovieFacade.popular.first).to be_a(Hash)
        expect(MovieFacade.popular.first[:title]).to be_a(String)
        expect(MovieFacade.popular.last).to have_key(:vote_avg)
        expect(MovieFacade.popular.count).to eq(20)
      end
    end

  context "#show" do
    it 'returns details, credits, and reviews for one movie' do
      VCR.use_cassette("show", :allow_playback_repeats => true) do
        expect(MovieFacade.show(550)).to be_a(Hash)
        movie = MovieFacade.show(550)
        
        expect(movie[:details][:title]).to be_a(String)
        expect(movie[:credits]).to be_a(Array)
        expect(movie[:reviews].first).to be_a(Hash)
        expect(movie[:credits]).to be_a(Array)
      end
    end
  end


  context 'private class methods' do #I guess we don't need to test these?
    context '#show_details' do
      xit 'returns movie details' do
        VCR.use_cassette("show_details", :allow_playback_repeats => true) do
          
          expect(MovieFacade.show_details(550)).to be_a("")
        end
      end
    end
  end
  
end