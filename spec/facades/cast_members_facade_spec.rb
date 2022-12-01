require 'rails_helper'

RSpec.describe CastMembersFacade do
  describe 'class methods' do
    it 'returns CastMember objects' do
      VCR.use_cassette('movie_credits') do
        cast = CastMembersFacade.cast(238)
        
        cast.each do |cast_member|
          expect(cast_member).to be_a CastMember
          expect(cast_member.character).to be_a String
          expect(cast_member.actor).to be_a String
        end
      end
    end
  end
end