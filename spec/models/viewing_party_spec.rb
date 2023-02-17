require 'rails_helper'

RSpec.describe ViewingParty, type: :model do
  describe 'validations' do
    it { should validate_presence_of :movie_id }
    it { should validate_presence_of :host_id }
    it { should validate_presence_of :duration }
    it { should validate_numericality_of :duration }
    it { should validate_presence_of :eventdate }
    it { should validate_presence_of :starttime }
  end

  describe 'relationships' do
    it { should have_many(:user_viewing_parties) }
    it { should have_many(:users).through(:user_viewing_parties) }
  end

  context 'model methods', :vcr do
    let!(:users) { create_list(:user, 4) }
    let!(:user1) { users.first }
    let!(:user2) { users.second }
    let!(:user3) { users.third }
    let!(:user4) { users.last }
    let!(:party1) { ViewingParty.create!(
                    poster_path: '/hBcY0fE9pfXzvVaY4GKarweriG2.jpg',
                    movie_name: 'The Shawshank Redemption',
                    movie_id: 123,
                    host_id: user1.id,
                    duration: 173,
                    eventdate: Date.yesterday,
                    starttime: Time.now) }

    let!(:party2) { ViewingParty.create!(
                    poster_path: '/3bhkrj58Vtu7enYsRolD1fZdja1.jpg',
                    movie_name: 'The Godfather',
                    movie_id: 141,
                    host_id: user2.id,
                    duration: 175,
                    eventdate: Date.tomorrow,
                    starttime: Time.now) }

    let!(:party3) { ViewingParty.create!(
                    poster_path: '/4RnCeRzvI1xk5tuNWjpDKzSnJDk.jpg',
                    movie_name: 'Happy Gilmore',
                    movie_id: 9614,
                    host_id: user2.id,
                    duration: 96,
                    eventdate: Date.tomorrow,
                    starttime: Time.now) }

    let!(:party4) { ViewingParty.create!(
                    poster_path: '/wAD7nnWh4e6wweffwmkLbf35uf0.jpg',
                    movie_name: 'Beverly Hills Ninja',
                    movie_id: 9622,
                    host_id: user3.id,
                    duration: 96,
                    eventdate: Date.tomorrow,
                    starttime: Time.now) }

    let!(:up1) { UserViewingParty.create!(
                 user_id: user1.id,
                 viewing_party_id: party1.id) }

    let!(:up2) { UserViewingParty.create!(
                 user_id: user1.id,
                 viewing_party_id: party2.id) }

    let!(:up3) { UserViewingParty.create!(
                 user_id: user1.id,
                 viewing_party_id: party3.id) }

    let!(:up4) { UserViewingParty.create!(
                 user_id: user3.id,
                 viewing_party_id: party3.id) }

    let!(:up5) { UserViewingParty.create!(
                 user_id: user2.id,
                 viewing_party_id: party4.id) }

    let!(:up6) { UserViewingParty.create!(
                 user_id: user4.id,
                 viewing_party_id: party4.id) }

    describe '.attendees' do
      it 'lists users who are not host as attendees' do

        expect(party1.host).to eq(user1)
        expect(party1.attendees).to eq("")
        expect(party2.host).to eq(user2)
        expect(party2.attendees).to eq("#{user1.name}")
        expect(party3.host).to eq(user2)
        expect(party3.attendees).to eq("#{user1.name} and #{user3.name}")
        expect(party4.host).to eq(user3)
        expect(party4.attendees).to eq("#{user2.name} and #{user4.name}")
      end
    end

    describe '#upcoming' do
      it 'scopes upcoming events' do

        expect(ViewingParty.upcoming).to eq([party2, party3, party4])
        expect(ViewingParty.upcoming).to_not include(party1)
      end
    end
  end
end
