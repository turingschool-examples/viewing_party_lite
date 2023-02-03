require 'rails_helper'

RSpec.describe ViewingParty do
  describe 'associations' do
    it {should have_many(:invitees)}
    it {should have_many(:users).through(:invitees)}
  end

  describe 'vaildations' do
    it { should validate_presence_of :duration }
    it { should validate_presence_of :when }
    it { should validate_presence_of :start_time }
    it { should validate_presence_of :movie_id }
  end

  describe '#get_movie' do
    it 'does' do
      vp = ViewingParty.create!(when: "11/21/2030 7:00", duration: 90, start_time: "7:00", movie_id: 550)
      movie = Movie.create!(api_id: 550, image_url: "https://image.tmdb.org/t/p/original/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg", title: "Fight")
      expect(vp.get_movie).to eq(movie)
    end
  end

  describe '#get_host' do
    it 'does' do
      user = User.create!(name: "John Cena", email: "John@email.com")
      viewing_party1 = ViewingParty.create!(when: "11/21/2030 7:00", duration: 90, start_time: "7:00", movie_id: 550)
      Invitee.create!(user_id: user.id, viewing_party_id: viewing_party1.id, host: true)

      expect(viewing_party1.get_host).to eq(user)
    end
  end
end