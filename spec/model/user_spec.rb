require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many(:viewing_party_users) }
    it { should have_many(:viewing_parties).through(:viewing_party_users) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
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

    describe 'party filtering methods' do
      let!(:user) { create :user }

      let(:party_1) { create :viewing_party }
      let(:party_2) { create :viewing_party }
      let(:party_3) { create :viewing_party }
      let(:party_4) { create :viewing_party }
      let(:party_5) { create :viewing_party }

      let!(:vpu_1) { ViewingPartyUser.create!(user_id: user.id, viewing_party_id: party_1.id, hosting: true) }
      let!(:vpu_2) { ViewingPartyUser.create!(user_id: user.id, viewing_party_id: party_2.id, hosting: true) }
      let!(:vpu_3) { ViewingPartyUser.create!(user_id: user.id, viewing_party_id: party_3.id, hosting: false) }
      let!(:vpu_4) { ViewingPartyUser.create!(user_id: user.id, viewing_party_id: party_4.id, hosting: false) }

      describe '#hosted_parties' do
        it 'returns an array of party objects where user is host' do
          expect(user.hosted_parties).to include(party_1, party_2)
          expect(user.hosted_parties).not_to include(party_3, party_4)
          expect(user.hosted_parties).not_to include(party_5)
        end
      end

      describe '#invited_parties' do
        it 'returns an array of party objects where user is invited' do
          expect(user.invited_parties).to include(party_3, party_4)
          expect(user.invited_parties).not_to include(party_1, party_2)
          expect(user.invited_parties).not_to include(party_5)
        end
      end

      describe '#movie_ids' do
        it 'returns an array of movie ids for a users viewing parties' do
          expect(user.movie_ids).to include(
            party_1.movie_id,
            party_2.movie_id,
            party_3.movie_id,
            party_4.movie_id
          )
          expect(user.movie_ids).not_to include(party_5.movie_id)
        end
      end
    end
  end

  describe 'class methods' do
    describe 'invited_users' do
      let!(:user) { create :user }
      let!(:friend_1) { create :user }
      let!(:friend_2) { create :user }
      let!(:friend_3) { create :user }

      xit 'accepts a hash from params and returns an array of user objects where original hash value = 1' do
        params_hash = {
          friend_1.id.to_s => '1',
          friend_2.id.to_s => '1',
          friend_3.id.to_s => '0'
        }

        expect(User.invited_users(params_hash)).to include(friend_1, friend_2)
        expect(User.invited_users(params_hash)).not_to include(friend_3)
      end
    end
  end
end
