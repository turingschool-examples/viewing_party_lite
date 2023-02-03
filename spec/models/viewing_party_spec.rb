require 'rails_helper'

RSpec.describe ViewingParty, type: :model do
  describe 'associations' do
    it { should belong_to :user }
    it { should have_many :viewing_party_users }
    it { should have_many(:users).through(:viewing_party_users) }
  end

  describe 'validations' do
    it { should validate_presence_of :movie_id }
    it { should validate_numericality_of :movie_id }
    it { should validate_presence_of :user_id }
    it { should validate_presence_of :title }
    it { should validate_presence_of :start_time }
    it { should validate_presence_of :duration }
    it { should validate_numericality_of :duration }
  end

  describe 'validation method' do
    it 'minimum_date' do
      date_true = ViewingParty.create(user_id: 1, movie_id: 1, runtime: 1, duration: 2, 
          start_time: Time.now, day: Date.tomorrow, title: "Movie Title", poster_path: "asdf")
      date_false = ViewingParty.create(user_id: 1, movie_id: 1, runtime: 1, duration: 2, 
          start_time: Time.now, day: Date.yesterday, title: "Movie Title", poster_path: "asdf")
          
      expect(date_true.minimum_date).to be nil
      expect(date_false.minimum_date).to eq ["Invalid Date"]
    end
  end
  
end