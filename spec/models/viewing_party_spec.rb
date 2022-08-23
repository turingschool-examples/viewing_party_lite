require 'rails_helper'

RSpec.describe ViewingParty, type: :model do
  describe 'validations' do
    it { should validate_numericality_of(:movie_id) }
    it { should validate_numericality_of(:duration) }
    it { should allow_value('08/24/2022').for(:date) }
    it { should_not allow_value('August 24, 2022').for(:date) } 
    it { should_not allow_value('1722').for(:start_time) }

  end
  
  describe 'relationships' do
    it {should have_many(:viewing_party_users) }
    it {should have_many(:users).through(:viewing_party_users) }
  end
end