require 'rails_helper'

RSpec.describe ViewingPartyUser, type: :model do
  describe 'relationships' do
    it { should belong_to(:viewing_party)}
    it { should belong_to(:user)}
  end

  describe 'validations' do
    # it { should validate_presence_of(:hosting) }
  end
end