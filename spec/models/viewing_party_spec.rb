require 'rails_helper'

RSpec.describe ViewingParty do
  describe 'associations' do
    it {should have_many(:invitees)}
    it {should have_many(:users).through(:invitees)}
  end

  describe 'vaildations' do

  end

  describe '#find_movie_deets' do
    it 'does' do
      vp = ViewingParty.create!(when: "11/21/2030 7:00", duration: 90, start_time: "7:00", movie_id: 550)
      movie = Movie.create!(api_id: 550, image_url: "https://image.tmdb.org/t/p/original/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg", title: "Fight")
      vp.find_movie
    end
  end
end