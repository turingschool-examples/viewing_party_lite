require 'rails_helper'

RSpec.describe Party, type: :model do
  describe 'relationships' do
    it { should have_many(:party_users) }
    it { should have_many(:users).through(:party_users) }
  end

  describe 'validations' do
    it { should validate_presence_of :movie_name }
    it { should validate_presence_of :movie_id }
    it { should validate_presence_of :date }
    it { should validate_presence_of :start_time }
    it { should validate_presence_of :duration }
  end

  describe 'behaviors' do
    it 'can return the id of the party host' do
      user1 = User.create!(name: 'Tommy Tanktop', email: 'tanktoptitan@aol.com')
      user2 = User.create!(name: 'User2', email: 'aol@email.com')
      user3 = User.create!(name: 'User3', email: 'email@aol.com')
      party1 = Party.create!(movie_name: 'Fight Club', movie_id: 1, date: Time.now.strftime('%d/%m/%Y'),
                             start_time: Time.now.strftime('%H:%M'), duration: 120)
      PartyUser.create(party_id: party1.id, user_id: user1.id, host: true)
      PartyUser.create(party_id: party1.id, user_id: user2.id, host: false)
      PartyUser.create(party_id: party1.id, user_id: user3.id, host: false)

      expect(party1.find_host).to eq user1.id
      expect(party1.find_host).to_not eq user2.id
    end
  end
end
