# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CastMember do
  describe 'initialize' do
    it 'has readable attributes' do
      VCR.use_cassette('movie_credits') do
        data = MoviesService.credits(238)[:cast].first
        @cast_member = CastMember.new(data)
      end

      expect(@cast_member.character).to be_a String
      expect(@cast_member.actor).to be_a String
    end
  end
end
