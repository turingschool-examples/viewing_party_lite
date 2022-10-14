# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many :viewing_party_users }
    it { should have_many(:viewing_parties).through(:viewing_party_users) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
  end

  describe 'class methods' do
    it 'has sort invitees class method' do
      user_1 = create(:user)
      user_2 = create(:user)
      user_3 = create(:user)
      
      expect(User.sort_invitees(user_1.id)).to eq([user_2, user_3])
      expect(User.sort_invitees(user_2.id)).to eq([user_1, user_3])
      expect(User.sort_invitees(user_3.id)).to eq([user_1, user_2])
    end
  end
end
