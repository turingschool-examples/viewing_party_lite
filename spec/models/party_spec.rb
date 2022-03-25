require 'rails_helper'

RSpec.describe Party, type: :model do
  describe "relationships" do
    it { should have_many(:user_parties) }
    it { should have_many(:users).through(:user_parties) }
  end

  describe "validations" do
    it { should validate_presence_of(:start_date) }
    it { should validate_presence_of(:start_time) }
    it { should validate_presence_of(:duration) }
    it { should validate_presence_of(:movie_id) }
    it { should validate_presence_of(:host_id) }
    it { should validate_numericality_of(:duration).is_greater_than(0) }
    it { should validate_numericality_of(:movie_id).is_greater_than(0) }
    it { should validate_numericality_of(:host_id).is_greater_than(0) }
  end

  describe 'instance methods' do 
    describe '#find_host' do
      it 'finds the name of a host for a party' do 
        UserParty.destroy_all
        User.destroy_all
        Party.destroy_all
        user = User.create!(name: 'Host', email: 'host@mail.com')
        user_2 = User.create!(name: 'also not host', email: 'neitherhost@mail.com')
        party_1 = Party.create!(start_date: '2022-03-25', duration: 90, start_time: '5:00', movie_id: 24126,
          host_id: user.id)
        party_2 = Party.create!(start_date: '2022-03-25', duration: 100, start_time: '6:00', movie_id: 278,
          host_id: user_2.id)
        user.user_parties.create!(party_id: party_1.id, user_id: user.id)
        user.user_parties.create!(party_id: party_1.id, user_id: user_2.id)
        # user.user_parties.create!(party_id: party_2.id, user_id: user.id)
        # user.user_parties.create!(party_id: party_2.id, user_id: user.id)

        expect(party_1.find_host).to eq(user.name)
      end 
    end 
  end 
end
