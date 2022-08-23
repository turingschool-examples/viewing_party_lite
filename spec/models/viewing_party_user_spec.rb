require 'rails_helper'

RSpec.describe ViewingPartyUser do
  describe 'relationships' do
    it { should belong_to(:user) }
    it { should belong_to(:viewing_party) }
  end
end