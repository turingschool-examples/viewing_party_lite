require 'rails_helper'

RSpec.describe UserParty, type: :model do
  describe 'validations' do
    it { should validate_presence_of :user_status }
    it { should validate_presence_of :user_id }
    it { should validate_presence_of :viewing_party_id }
  end

  describe 'relationships' do
    it { should belong_to :user }
    it { should belong_to :viewing_party }
  end
end
