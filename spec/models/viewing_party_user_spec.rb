require 'rails_helper'

RSpec.describe ViewingPartyUser do
  describe 'relationships' do
    it { should belong_to(:user) }
    it { should belong_to(:viewing_party) }
  end

  describe 'validations' do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:viewing_party_id) }
    it { should validate_presence_of(:is_host) }
  end
end