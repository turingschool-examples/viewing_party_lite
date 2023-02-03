require 'rails_helper'

RSpec.describe ViewingParty, type: :model do
  describe 'Associations' do
    it { should have_many(:user_viewing_parties) }
    it { should have_many(:users).through(:user_viewing_parties) }
  end

  describe 'Validations' do
    it { should validate_numericality_of(:duration) }
    it { should validate_presence_of(:movie_id) }
    it { should validate_presence_of(:start_time) }
    it { should validate_presence_of(:date) }
  end

  describe 'Instance Methods' do
    it 'returns the movie for a given viewing party' do
      json_response = File.read('spec/fixtures/the_godfather.json')
      stub_request(:get, "https://api.themoviedb.org/3/movie/238?api_key=#{ENV['movie_api_key']}&language=en-US").
        to_return(status: 200, body: json_response)

      viewing_party = ViewingParty.new({duration: 175, movie_id: 238, start_time: Time.now, date: Date.today})

      expect(viewing_party.movie).to be_a(Movie)
      expect(viewing_party.movie.title).to eq('The Godfather')
    end
  end
end