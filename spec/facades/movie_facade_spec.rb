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

  describe '#top_rated' do
    it 'returns the correct data type' do
      VCR.use_cassette("top_rated", :allow_playback_repeats => true) do
        expect(MovieFacade.top_rated).to be_a(Array)
        expect(MovieFacade.top_rated.first).to be_a(Hash)
        expect(MovieFacade.top_rated.first[:title]).to be_a(String)
        expect(MovieFacade.top_rated.last).to have_key(:vote_avg)
        expect(MovieFacade.top_rated.count).to eq(40)
      end
    end

  describe "#show" do
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

  describe '#search' do
    it 'returns the correct data type' do
      VCR.use_cassette("search", :allow_playback_repeats => true) do
        expect(MovieFacade.search('Hotel')).to be_a(Array)
        expect(MovieFacade.search('Hotel').first).to be_a(Hash)
        expect(MovieFacade.search('Hotel').first[:title]).to be_a(String)
        expect(MovieFacade.search('Hotel').last).to have_key(:vote_avg)
        expect(MovieFacade.search('Hotel').count).to eq(40)
      end
    end
  end

  describe "#new_party" do
    it 'returns the data required for a new party' do
      VCR.use_cassette("new_party", :allow_playback_repeats => true) do
        expect(MovieFacade.new_party(550)).to be_a(Hash)
        movie = MovieFacade.new_party(550)

        expect(movie[:title]).to be_a(String)
        expect(movie).to have_key(:runtime)
      end
    end
  end
end