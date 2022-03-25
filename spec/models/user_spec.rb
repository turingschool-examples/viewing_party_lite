require 'rails_helper'

RSpec.describe User, type: :model do
  describe "relationships" do
    it { should have_many(:user_parties) }
    it { should have_many(:parties).through(:user_parties) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
  end

  describe '#host' do 
    it 'returns parties where the user is the host' do 
      UserParty.destroy_all
      User.destroy_all
      Party.destroy_all
      user = User.create!(name: 'Host', email: 'host@mail.com')
      user_1 = User.create!(name: 'not host', email: 'nohost@mail.com')
      user_2 = User.create!(name: 'also not host', email: 'neitherhost@mail.com')
      party_1 = Party.create!(start_date: '2022-03-25', duration: 90, start_time: '5:00', movie_id: 1253,
        host_id: user.id)
      party_2 = Party.create!(start_date: '2022-03-25', duration: 100, start_time: '6:00', movie_id: 352,
        host_id: user_2.id)
      user.user_parties.create!(party_id: party_1.id, user_id: user.id)
      user.user_parties.create!(party_id: party_2.id, user_id: user.id)

      expect(user.is_host).to  eq([party_1])
    end 
  end 

  describe '#invitations' do 
    it 'returns parties that a user has been invited to' do 
      UserParty.destroy_all
      User.destroy_all
      Party.destroy_all
      user = User.create!(name: 'Host', email: 'host@mail.com')
      user_2 = User.create!(name: 'not host', email: 'nohost@mail.com')
      user_3 = User.create!(name: 'also not host', email: 'neitherhost@mail.com')
      user_4 = User.create!(name: 'still not host', email: 'neithermost@mail.com')
      party_1 = Party.create!(start_date: '2022-03-25', duration: 90, start_time: '5:00', movie_id: 1253,
        host_id: user.id)
      party_2 = Party.create!(start_date: '2022-03-25', duration: 100, start_time: '6:00', movie_id: 352,
        host_id: user_2.id)
      user_2.user_parties.create!(party_id: party_1.id, user_id: user_2.id)
      user.user_parties.create!(party_id: party_2.id, user_id: user.id)
      user_3.user_parties.create!(party_id: party_1.id, user_id: user_3.id)

      expect(user_2.invitations).to eq([party_1])
    end 
  end
end
