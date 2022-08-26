require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:email) }
    it { should allow_value('sally@gmail.com').for(:email) }
    it { should_not allow_value('1234').for(:email) }
  end

  describe 'relationships' do
    it { should have_many(:viewing_party_users) }
    it { should have_many(:viewing_parties).through(:viewing_party_users) }
  end

  describe 'class methods' do
    @users = let!(:users) { create_list(:user, 3) }
    it '::all_except_self' do
      user1 = users[0]
      user2 = users[1]
      user3 = users[2]
    
      expect(User.everyone_except(user1.id).to_a).to eq([user2, user3])
    end
  end
end