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
    it { should validate_presence_of :password_digest }
    it { should have_secure_password }
  end

  describe 'class methods' do
    describe '#other_users' do
      it 'returns all users except the one with the given id' do
        user1 = User.create!(name: 'Jane Powell', email: 'jpowell38@gmail.com', password: 'test123')
        user2 = User.create!(name: 'Judy Garland', email: 'jgarland@gmail.com', password: 'test123')
        user3 = User.create!(name: 'Fred Astaire', email: 'tapshoes@gmail.com', password: 'test123')

        expect(User.other_users(user1.id)).to match_array([user2, user3])
      end
    end
  end
end
