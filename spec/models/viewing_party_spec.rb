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

  describe "Instance Methods" do

    before :each do
      @viewing_party = ViewingParty.create!(movie_id: 11, duration: 200, date: 'December 14, 2022', start_time: '6:30 PM')
    end

    describe "#viewing_party_movie" do
      it "returns a movie from a movie_id", :vcr do

        expect(@viewing_party.viewing_party_movie[:title]).to eq("Star Wars")
      end
    end

    describe "#poster_path" do
      it "finds the poster path", :vcr do

        expect(@viewing_party.poster_path).to eq("/6FfCtAuVAW8XJjZ7eWeLibRLWTw.jpg")
      end
    end

    describe "#full_poster_path" do
      it "creates the full poster url", :vcr do
        expect(@viewing_party.full_poster_path).to eq("https://image.tmdb.org/t/p/original/6FfCtAuVAW8XJjZ7eWeLibRLWTw.jpg")
      end
    end
  end
end
