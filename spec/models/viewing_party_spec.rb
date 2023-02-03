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
    let!(:users) { create_list(:user, 9) }
    let!(:user) { create(:user) }
    before :each do
      json_response = File.read('spec/fixtures/the_godfather.json')
      stub_request(:get, "https://api.themoviedb.org/3/movie/238?api_key=#{ENV['movie_api_key']}&language=en-US").
        to_return(status: 200, body: json_response)
    end
    it 'returns the movie for a given viewing party' do
      viewing_party = ViewingParty.create!({duration: 175, movie_id: 238, start_time: Time.now, date: Date.today})

      expect(viewing_party.movie).to be_a(Movie)
      expect(viewing_party.movie.title).to eq('The Godfather')
    end

    it 'returns the host for a given viewing party' do
      viewing_party = ViewingParty.create!({duration: 175, movie_id: 238, start_time: Time.now, date: Date.today})
      user_viewing_party = viewing_party.user_viewing_parties.create!({user_id: user.id, hosting: true})
      expect(viewing_party.host).to eq(user.name)
    end

    it 'returns the invitees for a given viewing party' do
      viewing_party = ViewingParty.create!({duration: 175, movie_id: 238, start_time: Time.now, date: Date.today})
      user_viewing_party = viewing_party.user_viewing_parties.create!({user_id: user.id, hosting: true})
      users.each_with_index do |invitee, i|
        viewing_party.user_viewing_parties.create!({user_id: invitee.id}) unless i == 4
      end
      expect(viewing_party.invitees).to eq(users.map(&:name) - [users[4].name])
    end
  end
end