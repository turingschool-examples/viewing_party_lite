# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ViewingParty, type: :model do
  describe 'Relationships' do
    it { should have_many :user_viewing_parties }
    it { should have_many(:users).through(:user_viewing_parties) }
  end
  describe 'Validations' do
    it { should validate_presence_of :duration }
    it { should validate_presence_of :date }
    it { should validate_presence_of :time }
    it { should validate_presence_of :movie_id }
  end
  describe 'Instance Methods' do
    describe '.current_role' do
      it 'should return the viewing_party obj with current role' do
        @user1 = User.create!(name: 'jojo binks', email: 'jojo_binks@gmail.com')
        @party1 = ViewingParty.create!(duration: 140, date: '1999-07-20', time: '19:30', movie_id: 361_743)
        @user_party1 = UserViewingParty.create!(user_id: @user1.id, viewing_party_id: @party1.id, role: 1)
        @party2 = ViewingParty.create!(duration: 160, date: '2022-07-20', time: '17:30', movie_id: 500_042)
        @user_party2 = UserViewingParty.create!(user_id: @user1.id, viewing_party_id: @party2.id, role: 0)
        expect(@party1.current_party(@user1.id)).to eq @user_party1
        expect(@party2.current_party(@user1.id)).to eq @user_party2
      end
    end
    describe '.host' do
      it 'should return the viewing_party host' do
        @user1 = User.create!(name: 'jojo binks', email: 'jojo_binks@gmail.com')
        @user2 = User.create!(name: 'nicki minaj', email: 'nikki.minaj@gmail.com')
        @party1 = ViewingParty.create!(duration: 140, date: '1999-07-20', time: '19:30', movie_id: 361_743)
        @user_party1 = UserViewingParty.create!(user_id: @user1.id, viewing_party_id: @party1.id, role: 1)
        @user_party2 = UserViewingParty.create!(user_id: @user2.id, viewing_party_id: @party1.id, role: 0)
        expect(@party1.host).to eq("jojo binks")
        expect(@party1.host).to_not eq("nicki minaj")
      end
    end
  end
end
