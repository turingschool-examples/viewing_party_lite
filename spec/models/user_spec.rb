require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationship' do
    it { should have_many :user_viewing_parties }
    it { should have_many(:viewing_parties).through(:user_viewing_parties) }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
  end

  describe 'instance methods' do 
    describe '#users_parties' do 
      it 'returns a collection of users parties that also includes the status' do 
        user = User.create!(name: "Amanda", email: "amanda@turing.edu")
        party_1 = ViewingParty.create!(movie_id: 1, movie_title: "The Princess Bride", duration: 180, date: '2022-12-12', start_time: '17:00')
        party_2 = ViewingParty.create!(movie_id: 2, movie_title: "Jurassic Park", duration: 200, date: '2022-12-13', start_time: '19:00')
        party_3 = ViewingParty.create!(movie_id: 3, movie_title: "Moana", duration: 160, date: '2022-12-14', start_time: '14:00')
        UserViewingParty.create!(user: user, viewing_party: party_1, status: "Hosting")
        UserViewingParty.create!(user: user, viewing_party: party_2, status: "Invited")
        
        expect(user.users_parties).to eq([party_1, party_2])
        expect(user.users_parties.first.status).to eq("Hosting")
        expect(user.users_parties.second.status).to eq("Invited")
      end
    end
  end
end
