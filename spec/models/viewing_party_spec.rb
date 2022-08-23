require 'rails_helper'

RSpec.describe ViewingParty do
  describe 'relationships' do
    it { should have_many(:viewing_party_users) }
    it { should have_many(:users).through(:viewing_party_users) }
  end

  # describe 'validations' do
  #   it { should validate_presence_of(:user_id) }
  #   it { should validate_presence_of(:viewing_party_id) }
  #   it { should validate_presence_of(:is_host) }
  # end
end