require 'rails_helper'

RSpec.describe UserViewingParty, type: :model do
  describe 'Associations' do
    it { should belong_to(:viewing_party) }
    it { should belong_to(:user) }
  end

  describe 'Validations' do
    it { should validate_inclusion_of(:hosting).in?([true, false]) }
  end
end
