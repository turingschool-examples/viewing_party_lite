require 'rails_helper'

RSpec.describe User do
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of :email }
  end

  describe 'relationships' do
    it { should have_many(:user_viewing_parties) }
    it { should have_many(:viewing_parties).through(:user_viewing_parties) }
  end

  describe 'instance methods' do
    describe '#parties_hosted' do
      it 'shows all parties that the user is invited to' do
        user1 = User.create!(name: 'Jeff', email: 'dajeffe@gmail.com')
        user2 = User.create!(name: 'Geoff', email: 'dajeff2e@gmail.com')
        party1 = ViewingParty.create!(movie_title: 'Hot Rod',
                                      duration: 90,
                                      attendees: ['Mark', 'Julie', 'Steve', user1],
                                      start_date: '2022-08-19',
                                      start_time: '18:00',
                                      image: 'hot_rod_image',
                                      host_id: user2.id)
        party2 = ViewingParty.create!(movie_title: 'Semipro',
                                      duration: 90,
                                      attendees: ['Dave', 'Kim', 'James'],
                                      start_date: '2022-08-19',
                                      start_time: '17:00',
                                      image: 'semipro_image',
                                      host_id: user2.id)
        party3 = ViewingParty.create!(movie_title: 'Barry Lyndon',
                                      duration: 180,
                                      attendees: ['Ryan', 'Stirling', user1],
                                      start_date: '2022-08-19',
                                      start_time: '12:00',
                                      image: 'semipro_image',
                                      host_id: user1.id)
        uservp1 = UserViewingParty.create!(user_id: user1.id, viewing_party_id: party1.id)
        uservp2 = UserViewingParty.create!(user_id: user1.id, viewing_party_id: party2.id)
        uservp3 = UserViewingParty.create!(user_id: user1.id, viewing_party_id: party3.id)
        uservp2 = UserViewingParty.create!(user_id: user2.id, viewing_party_id: party1.id)
        uservp2 = UserViewingParty.create!(user_id: user2.id, viewing_party_id: party2.id)
        uservp3 = UserViewingParty.create!(user_id: user2.id, viewing_party_id: party3.id)

        expect(user2.parties_hosted).to eq([party1, party2])
      end
    end
  end
end
