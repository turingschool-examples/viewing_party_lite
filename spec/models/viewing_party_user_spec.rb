require 'rails_helper'

RSpec.describe ViewingPartyUser, type: :model do
  describe 'validations' do
    it { should allow_values(true, false).for(:host) }
    it { should_not allow_value(nil).for(:host) }
  end

  describe 'relationships' do
    it { should belong_to(:user) }
    it { should belong_to(:viewing_party) }
  end
end