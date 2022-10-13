require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many(:viewing_party_users)}
    it { should have_many(:viewing_parties).through(:viewing_party_users)}
  end

  describe 'validations' do
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:email)}
    it { should validate_uniqueness_of(:email)}
  end

  describe 'instance methods' do
    describe '#friends' do
      let!(:user) { create :user }
      let!(:friend_1) { create :user }
      let!(:friend_2) { create :user }

      # this could be refactored in the future to return only "friends", but currently is meant to return all users except user
      it 'returns all users EXCEPT the current user' do
        expect(user.friends).to include(friend_1, friend_2)
        expect(user.friends).not_to include(user)
      end
    end
  end

  describe 'class methods' do
    describe 'invited_users' do
      let!(:user) { create :user }
      let!(:friend_1) { create :user }
      let!(:friend_2) { create :user }
      let!(:friend_3) { create :user }

      it 'accepts a hash from params and returns an array of user objects where original hash value = 1' do
        params_hash = {
          friend_1.id.to_s => "1",
          friend_2.id.to_s => "1",
          friend_3.id.to_s => "0"
        }

        expect(User.invited_users(params_hash)).to include(friend_1, friend_2)
        expect(User.invited_users(params_hash)).not_to include(friend_3)
      end
    end
  end
end