# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many :user_viewing_parties }
    it { should have_many(:viewing_parties).through(:user_viewing_parties) }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :email }
  end

  describe 'class methods' do
    describe '#other_users' do
      it 'returns all users except the one with the given id' do
        user1 = User.create!(name: 'Jane Powell', email: 'jpowell38@gmail.com')
        user2 = User.create!(name: 'Judy Garland', email: 'jgarland@gmail.com')
        user3 = User.create!(name: 'Fred Astaire', email: 'tapshoes@gmail.com')

        expect(User.other_users(user1.id)).to match_array([user2, user3])
      end
    end
  end
end
