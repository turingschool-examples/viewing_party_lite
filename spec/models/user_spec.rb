# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many(:party_users) }
    it { should have_many(:parties).through(:party_users) }
  end

  describe 'validations' do

    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:email)}
    
    it { should validate_presence_of(:password_digest)}
    it { should validate_uniqueness_of(:email)}
    it { should have_secure_password }

  describe 'methods' do
    it 'methods return array of invited and hosted parties' do
      user1 = User.create(name: "Jim", email: 'Jim@mail.com', password: "dog", password_confirmation: "dog")
      user2 = User.create(name: "Tommy", email: 'Tommy@mail.com', password: "dog", password_confirmation: "dog")
      user3 = User.create(name: "Hoju", email: 'Hoju@mail.com', password: "dog", password_confirmation: "dog")
      party1 = Party.create!(duration: 300, date: Date.today, start_time: Time.now, user_id: user1.id, movie_id: 298, movie_name: "Shawshank Redemption")
      partyuser1 = PartyUser.create!(party: party1, user: user1)
      partyuser2 = PartyUser.create!(party: party1, user: user2)
      party2 = Party.create!(duration: 300, date: Date.today, start_time: Time.now, user_id: user2.id, movie_id: 19404, movie_name: "Parasite")
      partyuser3 = PartyUser.create!(party: party2, user: user1)
      partyuser4 = PartyUser.create!(party: party2, user: user2)
      party3 = Party.create!(duration: 300, date: Date.today, start_time: Time.now, user_id: user2.id, movie_id: 19404, movie_name: "Parasite")
      partyuser3 = PartyUser.create!(party: party2, user: user3)
      partyuser4 = PartyUser.create!(party: party2, user: user2)

      expect(user1.invited_parties.count).to eq (1)
      expect(user1.hosting_parties.count).to eq (1)
      expect(user1.invited_parties.first.movie_name).to eq("Parasite")
      expect(user1.hosting_parties.first.movie_name).to eq("Shawshank Redemption")
    end
  end
 end
end
