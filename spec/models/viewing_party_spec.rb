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

  describe 'instance methods' do
    let!(:users) { create_list(:user, 4) }
    let!(:user1) { users.first }
    let!(:user2) { users.second }
    let!(:user3) { users.third }
    let!(:user4) { users.last }

    it 'lists users who are not host as attendees' do
      party1 = ViewingParty.create!(
                  poster_path: 'movie poster path',
                  movie_name: 'The Shawshank Redemption',
                  movie_id: 123,
                  host_id: user1.id,
                  duration: 173,
                  eventdate: Date.today,
                  starttime: Time.now,
                )

      party2 = ViewingParty.create!(
                  poster_path: 'movie poster path',
                  movie_name: 'The Godfather',
                  movie_id: 141,
                  host_id: user1.id,
                  duration: 175,
                  eventdate: Date.tomorrow,
                  starttime: Time.now,
                )

      party3 = ViewingParty.create!(
                  poster_path: 'movie poster path',
                  movie_name: 'Happy Gilmore',
                  movie_id: 9614,
                  host_id: user2.id,
                  duration: 96,
                  eventdate: Date.tomorrow,
                  starttime: Time.now,
                )

      party4 = ViewingParty.create!(
                  poster_path: 'movie poster path',
                  movie_name: 'Maverick',
                  movie_id: 9622,
                  host_id: user3.id,
                  duration: 96,
                  eventdate: Date.tomorrow,
                  starttime: Time.now,
                )

      up1 = UserViewingParty.create!(
                        user_id: user1.id,
                        viewing_party_id: party1.id
                      )
      up2 = UserViewingParty.create!(
                        user_id: user1.id,
                        viewing_party_id: party2.id
                      )
      up3 = UserViewingParty.create!(
                        user_id: user2.id,
                        viewing_party_id: party3.id
                      )

      up4 = UserViewingParty.create!(
                        user_id: user1.id,
                        viewing_party_id: party3.id
                      )

      up5 = UserViewingParty.create!(
                        user_id: user3.id,
                        viewing_party_id: party3.id
                      )

      up5 = UserViewingParty.create!(
                        user_id: user2.id,
                        viewing_party_id: party4.id
                      )

      expect(party3.host).to eq(user2)
      expect(party3.attendees).to eq([user1.name, user3.name])
    end
  end
end
