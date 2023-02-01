require 'rails_helper'

RSpec.describe ViewingParty, type: :model do
  describe 'relationships' do
    it { should have_many :user_viewing_parties }
    it { should have_many(:users).through(:user_viewing_parties) }
  end

  describe 'validations' do
    it { should validate_presence_of :movie_id }
    it { should validate_presence_of :duration }
    it { should validate_presence_of :date }
    it { should validate_presence_of :start_time }
  end

  describe 'instance methods' do
    xit '#movie_title' do
      @viewing_party1 = create(:viewing_party, movie_id: 550)
      expect(@viewing_party1.movie_title).to eq 'Fight Club'
    end

    xit '#movie_poster' do
      @viewing_party1 = create(:viewing_party, movie_id: 550)
      expect(@viewing_party1.movie_poster).to eq("https://image.tmdb.org/t/p/h100/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg")
    end
  end
end