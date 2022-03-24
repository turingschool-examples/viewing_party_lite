require 'rails_helper'

RSpec.describe 'Cast Member Service' do
  describe 'class methods' do

    it 'can establish connection to MovieDB API and return cast members', :vcr do
      cast = CastMemberService.cast_members(345)
      expect(cast).to be_a(Hash)
      expect(cast[:cast]).to be_an(Array)
      expect(cast[:cast].first[:character]).to eq("Dr. William 'Bill' Harford")
      expect(cast[:cast].first[:name]).to eq("Tom Cruise")
    end
  end
end
