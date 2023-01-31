require 'rails_helper'

RSpec.describe UserViewingParty, type: :model do
  describe 'Associations' do
    it { should belong_to(:viewing_party) }
    it { should belong_to(:user) }
  end
end