# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MovieParty do
  describe 'validations' do
    it { should validate_presence_of(:movie_title) }
    it { should validate_presence_of(:duration) }
    it { should validate_presence_of(:start_time) }
    it { should validate_presence_of(:movie_id) }
  end

  describe 'relationships' do
    it { should have_many(:user_movie_parties) }
    it { should have_many(:users).through(:user_movie_parties) }
  end

  before(:each) do
    @user = create(:user)
    @user2 = create(:user)
    @user3 = create(:user)
    @user4 = create(:user)
    @party = create(:movie_party)
    @party2 = create(:movie_party)
    @user_movie_party = UserMovieParty.create!(user_id: @user.id, movie_party_id: @party.id, status: 0)
  end

  describe 'instance methods' do
    describe '#status' do
      it 'returns status of user associated with the movie party' do
        expect(@party.status(@user)).to eq('hosting')
      end
    end

    describe '#poster_url' do
      it 'returns the url for the image of the poster' do
        VCR.use_cassette('godfather_movie') do
          expect(@party.poster_url).to be_a String
        end
      end
    end

    describe '#create_user_movie_parties' do 
      it 'creates user movie partys based on host and invites' do
        id_array = [@user3.id, @user4.id]
        @party2.create_user_movie_parties(@user2, id_array)
        
        expect(@user2.user_movie_parties).to_not match_array([])
        expect(@user2.user_movie_parties.first.status).to eq('hosting')
        expect(@user3.user_movie_parties).to_not match_array([])
        expect(@user4.user_movie_parties).to_not match_array([])
      end
    end
  end
end
