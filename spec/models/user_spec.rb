# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  context 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
  end

  context 'relationships' do
    it { should have_many(:party_users) }
    it { should have_many(:viewing_parties).through(:party_users) }
  end

  context 'instance methods' do
    it '.is_host?(party_id) returns true or false if the user is host' do
      user = User.create!(name: 'Brylan', email: 'brylan.gannon112@gmail.com')
      user2 = User.create!(name: 'John', email: 'John.Hennerich@gmail.com')
      party = ViewingParty.create!(movie_title: 'Mad Max', duration: 100, date: '2022/10/20', start_time: '7:00')

      PartyUser.create!(user_id: user.id, viewing_party_id: party.id, host: true)
      PartyUser.create!(user_id: user2.id, viewing_party_id: party.id)

      expect(user.is_host?(party.id)).to be true
      expect(user2.is_host?(party.id)).to be false
    end
  end
end
