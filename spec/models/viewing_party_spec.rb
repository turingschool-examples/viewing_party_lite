require 'rails_helper'

RSpec.describe ViewingParty, type: :model do
  describe 'validations' do
    it { should validate_presence_of :movie_title }
    it { should validate_presence_of :movie_id }
    it { should validate_presence_of :host_id }
    it { should validate_presence_of :duration }
    it { should validate_numericality_of :duration }
    it { should validate_presence_of :date }
    it { should validate_presence_of :start_time }
    it { should validate_presence_of :poster_path }
  end

  describe 'relationships' do
    it { should belong_to(:host).class_name('User') }
    it { should have_many(:user_viewing_parties) }
    it { should have_many(:users).through(:user_viewing_parties) }
  end

  describe 'instance methods' do
    let!(:users) { create_list(:user, 3) }
    let!(:user1) { users.first }
    let!(:user2) { users.second}
    let!(:user3) { users.last}

    it 'is either hosting or attending' do
      party1 = ViewingParty.create!(
                  poster_path: 'movie poster path',
                  movie_title: 'The Shawshank Redemption',
                  movie_id: 123,
                  host_id: user1.id,
                  duration: 173,
                  date: Date.today,
                  start_time: Time.now,
                )

      party2 = ViewingParty.create!(
                  poster_path: 'movie poster path',
                  movie_title: 'The Godfather',
                  movie_id: 141,
                  host_id: user1.id,
                  duration: 175,
                  date: Date.tomorrow,
                  start_time: Time.now,
                )

      party3 = ViewingParty.create!(
                  poster_path: 'movie poster path',
                  movie_title: 'Happy Gilmore',
                  movie_id: 9614,
                  host_id: user2.id,
                  duration: 96,
                  date: Date.tomorrow,
                  start_time: Time.now,
                )

      party4 = ViewingParty.create!(
                  poster_path: 'movie poster path',
                  movie_title: 'Maverick',
                  movie_id: 9622,
                  host_id: user3.id,
                  duration: 96,
                  date: Date.tomorrow,
                  start_time: Time.now,
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
      expect(party3.attendees).to eq("#{user1.name} and #{user3.name}")
    end
  end
end
