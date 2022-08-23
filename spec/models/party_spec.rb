# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Party, type: :model do
  describe 'validations' do
    it { should validate_numericality_of :movie_id }
    it { should validate_presence_of :start_time }
    it { should validate_numericality_of :duration }
  end
  describe 'relationships' do
    it { should have_many :party_users }
    it { should have_many(:users).through(:party_users) }
  end
end
