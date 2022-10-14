# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ViewingParty, type: :model do
  describe 'relationships' do
    it { should have_many :viewing_party_users }
    it { should have_many(:users).through(:viewing_party_users) }
  end

  describe 'validations' do
    it { should validate_presence_of(:duration) }
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:time) }
    it { should validate_presence_of(:host_id) }
  end

  describe 'instance method' do
    it 'invitees' do
      user_1 = create(:user)
      user_2 = create(:user)
      user_3 = create(:user)
      user_4 = create(:user)
      user_5 = create(:user)

      viewing_party = create(:viewing_party, host_id: user_1.id)

      create(:viewing_party_users, user: user_1, viewing_party: viewing_party)
      create(:viewing_party_users, user: user_2, viewing_party: viewing_party)
      create(:viewing_party_users, user: user_3, viewing_party: viewing_party)

      expect(viewing_party.invitees(user_1.id)).to eq([user_2, user_3])
    end
  end
end
