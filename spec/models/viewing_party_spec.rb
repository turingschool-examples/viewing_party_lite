# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ViewingParty do
  describe 'Relationships' do
    it { should have_many :viewing_party_users }
    it { should have_many(:users).through(:viewing_party_users) }
  end

  describe 'Validations' do
    it { should validate_presence_of :movie_id }
    it { should validate_numericality_of(:movie_id).is_greater_than(0) }
    it { should validate_presence_of :duration }
    it { should validate_numericality_of(:duration).is_greater_than(0) }
    it { should validate_presence_of :date }
    it { should validate_presence_of :start_time }
  end
end
