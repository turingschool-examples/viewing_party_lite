require 'rails_helper'

RSpec.describe Party, type: :model do
  before :each do
    stub_request(:get, 'https://api.themoviedb.org/3/movie/1?api_key')
      .to_return(status: 200, body: File.read('spec/fixtures/robot_chicken_response.json'), headers: {})
  end
  
  let!(:user1) { User.create!(name: 'Brian', email: 'brian@test.com', password: 'password123', password_confirmation: 'password123') }
  let!(:user2) { User.create!(name: 'Peter', email: 'peter@test.com', password: 'password123', password_confirmation: 'password123') }
  let!(:user3) { User.create!(name: 'Chris', email: 'chris@test.com', password: 'password123', password_confirmation: 'password123') }
  let!(:user4) { User.create!(name: 'Meg', email: 'meg@test.com', password: 'password123', password_confirmation: 'password123') }
  let!(:user5) { User.create!(name: 'Anth', email: 'anth@test.com', password: 'password123', password_confirmation: 'password123') }
  let!(:user6) { User.create!(name: 'Thomas', email: 'thomas@test.com', password: 'password123', password_confirmation: 'password123') }
  let!(:party1) { Party.create!(duration: 160, start_time: Time.now, movie_id: 1) }
  let!(:user_party1) { UserParty.create!(user: user1, party: party1, is_host: true) }
  let!(:user_party2) { UserParty.create!(user: user2, party: party1, is_host: false) }

  describe 'relationships' do
    it { should have_many :user_parties }
    it { should have_many(:users).through(:user_parties) }
  end

  describe 'validations' do
    it { should validate_presence_of :duration }
    it { should validate_presence_of :start_time }
  end

  describe 'instance methods' do
    it '#movie finds the movie of the party' do
      movie = party1.movie
      expect(movie).to be_a(Movie)
    end

    it '#movie finds the host of the party' do
      expect(party1.host).to eq('Brian')
    end
  end
end
