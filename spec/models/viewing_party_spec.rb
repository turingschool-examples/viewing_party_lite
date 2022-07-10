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

    it 'will return an image path', :vcr do
      user1 = User.create!(name: 'Casey', email: 'EternalSquiggles@Geemail.com')
      godfather = user1.viewing_parties.create!(duration: 200, date: Date.today, time: Time.now, movie_id: 238)

      expect(godfather.display_image).to eq("http://image.tmdb.org/t/p/w500/3bhkrj58Vtu7enYsRolD1fZdja1.jpg")
    end
  end

  describe 'class methods' do
    before(:each) do
      @spirit = @user1.viewing_parties.create!(duration: 180, date: Date.today, time: Time.now, movie_id: 129)
      PartyUser.create!(user_id: @user2.id, viewing_party_id: @spirit.id)
      PartyUser.create!(user_id: @user3.id, viewing_party_id: @spirit.id)
      PartyUser.create!(user_id: @user4.id, viewing_party_id: @spirit.id)

      @rocky = @user3.viewing_parties.create!(duration: 180, date: Date.tomorrow, time: Time.now, movie_id: 36685)
      PartyUser.create!(user_id: @user2.id, viewing_party_id: @rocky.id)
      PartyUser.create!(user_id: @user1.id, viewing_party_id: @rocky.id)
      PartyUser.create!(user_id: @user4.id, viewing_party_id: @rocky.id)
    end

    it 'can display viewing parties that a user is invited to' do
      parties = ViewingParty.invited(@user1.id)
      expect(parties).to eq([@rocky])
    end
  end
end
