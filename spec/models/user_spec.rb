require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
    it { should have_secure_password }
  end

  describe 'relationships' do
    it { should have_many(:user_viewing_parties) }
    it { should have_many(:viewing_parties).through(:user_viewing_parties) }
  end

  describe 'instance methods' do
    let!(:users) { create_list(:user, 3) }
    let!(:user1) { users.first }
    let!(:user2) { users.second}
    let!(:user3) { users.last}

    it 'can downcase an email' do
      user = User.create!(
                    name: 'Mike',
                    email: 'MikeDao@fakemail.com',
                    password: 'password',
                    password_confirmation: 'password'
                  )

      expect(user.email).to eq('mikedao@fakemail.com')
      expect(user.name_and_email).to eq('Mike (mikedao@fakemail.com)')
    end

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
      expect(user1.hosting).to eq([party1, party2])
      # expect(user1.attending).to eq([party2])
    end
  end
end
