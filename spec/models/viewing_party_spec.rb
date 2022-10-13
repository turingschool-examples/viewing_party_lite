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

    it 'lists users who are not host as attendees' do
            party1 = ViewingParty.create!(
                  poster_path: 'movie poster path',
                  movie_title: 'The Shawshank Redemption',
                  movie_id: 123,
                  host_id: user1.id,
                  duration: 456,
                  date: Date.today,
                  start_time: Time.now
                )

      up1 = UserViewingParty.create!(
                        user_id: user1.id,
                        viewing_party_id: party1.id
                      )
      expect(party1.host).to eq(user1)
      expect(party1.attendees).to eq([user2, user3])
    end
  end
end
