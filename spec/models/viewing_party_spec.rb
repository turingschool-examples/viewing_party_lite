require 'rails_helper'

RSpec.describe ViewingParty do
  describe 'relationships' do
    it { should have_many(:users).through(:viewing_party_users) }
    it { should have_many(:viewing_party_users) }
    it { should belong_to(:movie) }
  end
  
  describe 'validations' do
    it { should validate_presence_of :duration }
    it { should validate_presence_of :party_date }
  end
  
end