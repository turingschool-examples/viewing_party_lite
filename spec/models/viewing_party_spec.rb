require 'rails_helper'

RSpec.describe ViewingParty, type: :model do
  describe 'validations' do
    it { should validate_presence_of :start_time }
    it { should validate_presence_of :party_duration_minutes }
    it { should validate_presence_of :movie_title }
    it { should validate_presence_of :movie_duration_minutes }
  end

  describe 'relationships' do
    it { should have_many :viewing_party_users }
    it { should have_many(:users).through( :viewing_party_users) }
  end
end 