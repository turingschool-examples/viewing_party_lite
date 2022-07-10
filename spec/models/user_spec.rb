require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many(:party_users) }
    it { should have_many(:parties).through(:party_users) }
  end

  describe 'validations' do
    it { should validate_presence_of :email }
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :email }
  end

  describe 'behaviors' do
    it 'can tell if the user is a party host' do
      user1 = User.create!(name: 'Tommy Tanktop', email: 'tanktoptitan@aol.com')
      party1 = Party.create!(movie_name: 'Fight Club', movie_id: 1, date: Time.now.strftime('%d/%m/%Y'),
                             start_time: Time.now.strftime('%H:%M'), duration: 120)
      party2 = Party.create!(movie_name: 'Armageddon', movie_id: 4,
                             date: Time.now.strftime('%d/%m/%Y'), start_time: Time.now.strftime('%H:%M'), duration: 120)
      PartyUser.create(party_id: party1.id, user_id: user1.id, host: true)
      PartyUser.create(party_id: party2.id, user_id: user1.id, host: false)

      expect(user1.host?(party1.id)).to eq true

      expect(user1.host?(party2.id)).to eq false
    end
  end
end

