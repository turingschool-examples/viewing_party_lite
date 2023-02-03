require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Associations' do
    it { should have_many(:user_viewing_parties) }
    it { should have_many(:viewing_parties).through(:user_viewing_parties) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).with_message('User already exists with given email').case_insensitive }
    it { should allow_value('sam@example.com').for(:email) }
    it { should_not allow_value('samexample.com').for(:email) }
  end

  describe 'Methods' do
    before :each do
      json_response_1 = File.read('spec/fixtures/the_godfather.json')
      stub_request(:get, "https://api.themoviedb.org/3/movie/238?api_key=#{ENV['movie_api_key']}&language=en-US")
        .to_return(status: 200, body: json_response_1)
      json_response_2 = File.read('spec/fixtures/shawshank_redemption.json')
      stub_request(:get, "https://api.themoviedb.org/3/movie/278?api_key=#{ENV['movie_api_key']}&language=en-US")
        .to_return(status: 200, body: json_response_2)
      json_response_3 = File.read('spec/fixtures/puss_in_boots.json')
      stub_request(:get, "https://api.themoviedb.org/3/movie/315162?api_key=#{ENV['movie_api_key']}&language=en-US")
        .to_return(status: 200, body: json_response_3)
    end
    describe 'Instance Methods' do
      let!(:users) { create_list(:user, 10) }
      let!(:viewing_parties) { create_list(:viewing_party, 3) }
      let!(:user_viewing_parties) { create_list(:user_viewing_party, 20) }
      let(:user) { users.first }
      let(:party) { user.viewing_parties.first }

      it 'returns the user viewing party for a given user and viewing party' do
        expect(user.find_user_viewing_party(party)).to be_a(UserViewingParty)
        expect(user.find_user_viewing_party(party).user_id).to eq(user.id)
        expect(user.find_user_viewing_party(party).viewing_party_id).to eq(party.id)
      end

      it 'returns all users apart from a specific user' do
        expect(user.all_but_self.first).to be_a(User)
        expect(user.all_but_self.count).to eq 9
        expect(user.all_but_self.filter_map { |other_user| other_user if other_user == user }).to eq([])
      end
    end
  end
end
