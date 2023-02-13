require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user1) { User.create!(name: 'Brian', email: 'brian@test.com', password: 'password123', password_confirmation: 'password123') }
  let!(:user2) { User.create!(name: 'Peter', email: 'peter@test.com', password: 'password123', password_confirmation: 'password123') }
  let!(:user3) { User.create!(name: 'Chris', email: 'chris@test.com', password: 'password123', password_confirmation: 'password123') }
  let!(:user4) { User.create!(name: 'Meg', email: 'meg@test.com', password: 'password123', password_confirmation: 'password123') }
  let!(:user5) { User.create!(name: 'Anth', email: 'anth@test.com', password: 'password123', password_confirmation: 'password123') }
  let!(:user6) { User.create!(name: 'Thomas', email: 'thomas@test.com', password: 'password123', password_confirmation: 'password123') }

  let!(:party1) { Party.create!(duration: 160, start_time: Time.now, movie_id: 1) }
  let!(:party2) { Party.create!(duration: 160, start_time: Time.now, movie_id: 2) }
  let!(:user_party1) { UserParty.create!(user: user1, party: party1, is_host: true) }
  let!(:user_party2) { UserParty.create!(user: user2, party: party1, is_host: false) }
  let!(:user_party3) { UserParty.create!(user: user3, party: party2, is_host: true) }
  let!(:user_party4) { UserParty.create!(user: user2, party: party2, is_host: false) }

  describe 'relationships' do
    it { should have_many :user_parties }
    it { should have_many(:parties).through(:user_parties) }
  end

  describe 'validations' do
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :password_digest }
    it { should have_secure_password }
    it { should validate_uniqueness_of :email }
    # Remember, bcrypt will check out passwords, and store it as `password_digest`
  end

  describe 'password stuff' do
    it 'has password stuff' do
      expect(user4).to_not have_attribute(:password)
      expect(user4.password_digest).to_not eq('password123')
    end
  end

  describe '#hosted_parties' do
    it 'returns all parties where user is host' do
      expect(user1.hosted_parties).to eq([party1])
      expect(user2.hosted_parties).to eq([])
      expect(user3.hosted_parties).to eq([party2])
    end
  end

  describe '#invited_parties' do
    it 'returns all parties where user is NOT a host' do
      expect(user1.invited_parties).to eq([])
      expect(user2.invited_parties).to eq([party1, party2])
      expect(user3.invited_parties).to eq([])
    end
  end
end