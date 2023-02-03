require 'rails_helper'

RSpec.describe Party, type: :model do
  before :each do
    stub_request(:get, "https://api.themoviedb.org/3/movie/1?api_key").
    to_return(status: 200, body: File.read("spec/fixtures/robot_chicken_response.json"), headers: {})
  end
  let!(:user1) { User.create!(name: "Anthony", email: "anthony@gmail.com") }
  let!(:user2) { User.create!(name: "Thomas", email: "thomas@gmail.com") }
  let!(:user3) { User.create!(name: "Jessica", email: "jessica@gmail.com") }
  let!(:party1) { Party.create!(duration: 160, start_time: Time.now, movie_id: 1 ) }
  let!(:user_party1) { UserParty.create!(user: user1, party: party1, is_host: true) } 
  let!(:user_party2) { UserParty.create!(user: user2, party: party1, is_host: false) }

  describe 'relationships' do
    it { should have_many :user_parties }
    it { should have_many(:users).through(:user_parties) }
  end

  describe 'validations' do
    it { should validate_presence_of :duration }
    it { should validate_presence_of :start_time }
    # it { should validate_presence_of :movie_id }
  end

  describe 'instance methods' do
    it '#movie finds the movie of the party' do
      movie = party1.movie
      expect(movie).to be_a(ShowMovie)
    end

    it '#movie finds the movie of the party' do
      # movie = party1.movie
      expect(party1.host_of(party1)).to eq("Anthony")
    end
  end
end
