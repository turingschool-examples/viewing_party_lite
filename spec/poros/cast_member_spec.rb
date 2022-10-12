# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'CastMember' do
  describe 'exists' do
    it 'exists and has attributes' do
      fight_club = File.read('spec/fixtures/fight_club.json')
      fc = JSON.parse(fight_club, symbolize_names: true)
      first_cast_member = CastMember.new(fc[:credits][:cast].first)

      expect(first_cast_member).to be_a CastMember
      expect(first_cast_member.name).to be_a String
      expect(first_cast_member.character).to be_a String
    end
  end
end
