require 'rails_helper'

RSpec.describe ViewingParty, type: :model do
  describe 'validations' do
    it { should validate_presence_of :start_time }
    it { should validate_presence_of :party_duration_minutes }
    it { should validate_presence_of :movie_title }
    it { should validate_presence_of :movie_duration_minutes }
  end

  describe 'relationships' do
    it { should have_many :viewing_party_users }
    it { should have_many(:users).through( :viewing_party_users) }
  end

  it 'returns the host of the viewing party' do
    user1 = User.create!(first_name: "Homer", last_name: "Simpson", email:"name@test.com")
    user2 = User.create!(first_name: "James", last_name: "Rock", email:"james@test.com")

    viewingparty1 = ViewingParty.create!(start_time: DateTime.parse('3rd Feb 2001 04:00:00'), party_duration_minutes: 200, movie_title: "The Shawshank Redemption", movie_duration_minutes: 142)
      vp1_u1 = ViewingPartyUser.create!(user_id: user1.id, viewing_party_id: viewingparty1.id, status: :invited)
      vp1_u2 = ViewingPartyUser.create!(user_id: user2.id, viewing_party_id: viewingparty1.id, status: :hosting)

    expect(viewingparty1.host_name).to eq("James Rock")
  end

  it 'will not validate the creation of a vp with a party duration less than the movie duration' do
    vp = ViewingParty.create(start_time: DateTime.parse('3rd Feb 2001 04:00:00'), party_duration_minutes: 120, movie_title: "The Shawshank Redemption", movie_duration_minutes: 142)
    expect(vp.errors.messages[:party_duration_minutes][0]).to eq("Party duration has to be longer than the movie duration")
  end
end 