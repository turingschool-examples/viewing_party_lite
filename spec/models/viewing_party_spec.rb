# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ViewingParty do
  describe 'Relationships' do
    it { should have_many :viewing_party_users }
    it { should have_many(:users).through(:viewing_party_users) }
  end

  describe 'Validations' do
    it { should validate_presence_of :movie_id }
    it { should validate_numericality_of(:movie_id).is_greater_than(0) }
    it { should validate_presence_of :duration }
    it { should validate_numericality_of(:duration).is_greater_than(0) }
    it { should validate_presence_of :date }
    it { should validate_presence_of :start_time }
  end

  describe 'Instance Methods' do
    before :each do
      @user1 = User.create!(name: 'Eli Fuchsman', email: 'eli@gmail.com', password: "test1")
      @user2 = User.create!(name: 'Kristen Nestler', email: 'kristen@gmail.com', password: "test2")
      @user3 = User.create!(name: 'John John', email: 'John@gmail.com', password: "test3")
      @user4 = User.create!(name: 'Luke Skywalker', email: 'luke@gmail.com', password: "test4")
      @user5 = User.create!(name: 'Michael Corleone', email: 'mike@gmail.com', password: "test5")
      @user6 = User.create!(name: 'Tony Montana', email: 'tony@gmail.com', password: "test6")
      @user7 = User.create!(name: 'Bruce Wayne', email: 'bruce@gmail.com', password: "test7")
      @user8 = User.create!(name: 'Harvey Dent', email: 'harvey@gmail.com', password: "test8")

      @viewing_party = ViewingParty.create!(movie_id: 11, duration: 200, date: 'December 14, 2022',
                                            start_time: '6:30 PM')

      @vpu1 = ViewingPartyUser.create!(user: @user1, viewing_party: @viewing_party, host: 1)
      @vpu2 = ViewingPartyUser.create!(user: @user2, viewing_party: @viewing_party)
      @vpu3 = ViewingPartyUser.create!(user: @user3, viewing_party: @viewing_party)
      @vpu4 = ViewingPartyUser.create!(user: @user4, viewing_party: @viewing_party)
      @vpu5 = ViewingPartyUser.create!(user: @user5, viewing_party: @viewing_party)
      @vpu6 = ViewingPartyUser.create!(user: @user6, viewing_party: @viewing_party)
      @vpu7 = ViewingPartyUser.create!(user: @user7, viewing_party: @viewing_party)
      @vpu8 = ViewingPartyUser.create!(user: @user8, viewing_party: @viewing_party)
    end

    describe '#viewing_party_movie' do
      it 'returns a movie from a movie_id', :vcr do
        expect(@viewing_party.viewing_party_movie[:title]).to eq('Star Wars')
      end
    end

    describe '#poster_path' do
      it 'finds the poster path', :vcr do
        expect(@viewing_party.poster_path).to eq('/6FfCtAuVAW8XJjZ7eWeLibRLWTw.jpg')
      end
    end

    describe '#full_poster_path' do
      it 'creates the full poster url', :vcr do
        expect(@viewing_party.full_poster_path).to eq('https://image.tmdb.org/t/p/original/6FfCtAuVAW8XJjZ7eWeLibRLWTw.jpg')
      end
    end

    describe '#host' do
      it 'returns the party host', :vcr do
        expect(@viewing_party.host).to eq('Eli Fuchsman')
      end
    end

    describe '#invited' do
      it '#returns all invited users to the party', :vcr do
        expect(@viewing_party.invited).to eq(['Bruce Wayne', 'Harvey Dent', 'John John', 'Kristen Nestler',
                                              'Luke Skywalker', 'Michael Corleone', 'Tony Montana'])
      end
    end
  end
end
