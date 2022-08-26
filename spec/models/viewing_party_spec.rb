require 'rails_helper'

RSpec.describe ViewingParty, type: :model do
  @users = let!(:users) { create_list(:user, 3) }

  describe 'validations' do
    it { should validate_numericality_of(:movie_id) }
    it { should validate_numericality_of(:duration) }
    it { should allow_value('08/24/2022').for(:date) }
    it { should_not allow_value('August 24, 2022').for(:date) } 
    it { should_not allow_value('1722').for(:start_time) }
    it { should allow_value('7:00pm').for(:start_time) }

  end
  
  describe 'relationships' do
    it {should have_many(:viewing_party_users) }
    it {should have_many(:users).through(:viewing_party_users) }
  end

  describe 'instance methods' do
    it '#find_host' do
      user1 = users[0]
      user2 = users[1]
      user3 = users[2]
      viewing_party = ViewingParty.create!(movie_id: 244786, duration: 107, date: '09/22/2022', start_time: '8:00pm')
      ViewingPartyUser.create!(user_id: user1.id, viewing_party_id: viewing_party.id, host: false) 
      # user 2 invited 
      ViewingPartyUser.create!(user_id: user2.id, viewing_party_id: viewing_party.id, host: false) 
      # user 3 hosting 
      ViewingPartyUser.create!(user_id: user3.id, viewing_party_id: viewing_party.id, host: true) 

      expect(viewing_party.find_host.first).to eq(user3)
    end
  end
end