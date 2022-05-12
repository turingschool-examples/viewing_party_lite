require 'rails_helper'

RSpec.describe User, type: :model do
  it "relationships" do
    should have_many(:user_parties)
    should have_many(:parties).through(:user_parties)
  end

  it "validations" do
    should validate_presence_of(:name)
    should validate_presence_of(:email)
  end

  it "has method #parties_im_hosting that returns all of a user's parties and no others" do
    user1 = User.create!(name: "Twitch", email: "twitch@dogmail.com")
    user2 = User.create!(name: "Clip Clop", email: "clickclack@dogmail.com")
    party1 = Party.create!(host_id: user1.id, duration: 1, date: Time.parse("2022.04.23 16:30"), movie_id: 524)
    party2 = Party.create!(host_id: user1.id, duration: 15, date: Time.parse("2022.04.25 15:00"), movie_id: 740)
    party3 = Party.create!(host_id: user2.id, duration: 12, date: Time.parse("2022.04.28 11:00"), movie_id: 600)

    expected = user1.parties_im_hosting
    expect(expected.include?(party1)).to eq true
    expect(expected.include?(party2)).to eq true
    expect(expected.include?(party3)).to eq false
  end
end
