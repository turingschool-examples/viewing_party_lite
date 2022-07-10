require 'rails_helper'

RSpec.describe ViewingParty, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:duration)}
    it {should validate_presence_of(:date)}
    it {should validate_presence_of(:time)}
    it {should validate_presence_of(:movie_id)}
  end

  describe 'relationships' do
    it {should belong_to :user}
    it {should have_many :party_users}
    it {should have_many(:users).through(:party_users)}
  end

  describe 'instance methods' do
    it 'can display a title', :vcr do
      user1 = User.create!(name: 'Casey', email: 'EternalSquiggles@Geemail.com')
      spirit = user1.viewing_parties.create!(duration: 180, date: Date.today, time: Time.now, movie_id: 129)

      expect(spirit.display_title).to eq("Spirited Away")
    end
  end
end
