require 'rails_helper'

RSpec.describe ViewingParty do
  describe 'relationships' do
    it { should have_many(:users).through(:viewing_party_users) }
    it { should have_many(:viewing_party_users) }
  end
  
  describe 'validations' do
    it { should validate_presence_of :duration }
    it { should validate_presence_of :party_date }
    it { should validate_presence_of :party_time }
    it { should validate_presence_of :host_id }
  end
  
end