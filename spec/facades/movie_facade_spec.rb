require 'rails_helper'

RSpec.describe MovieFacade do
  it 'gets base github repo hash with name field as a string' do
    VCR.use_cassette("fight_club_info_card", :allow_playback_repeats => true) do
      expect(MovieFacade.info_card(550)).to be_a(Hash)
    end
  end
end