# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ViewingParty, type: :model do
  describe 'associations' do
    it { should have_many :user_viewing_parties }
    it { should have_many(:users).through(:user_viewing_parties) }
  end

  describe 'validations' do
    it { should validate_presence_of :date }
    it { should validate_presence_of :movie_id }
    it { should validate_presence_of :duration }
    it { should validate_presence_of :start_time }
  end

  describe 'instance methods' do
    before do
      @party1 = ViewingParty.create!(date: 'Sat, 09 Jul 2022', start_time: '2022-07-09 19:14:46.264435 -0400',
                                     duration: 180, movie_id: 120)
    end
    describe '.movie' do
      it 'returns the movie that is being watched at the viewing party', :vcr do
        expect(@party1.movie.title).to eq('The Lord of the Rings: The Fellowship of the Ring')
      end
    end

    describe '.formatted_date' do
      it 'returns the formatted date of the party for display on page', :vcr do
        expect(@party1.formatted_date).to eq('Saturday, July 09')
      end
    end

    describe '.formatted_time' do
      it 'returns the formatted date of the party for display on page', :vcr do
        expect(@party1.formatted_time).to eq(' 7:14 PM')
      end
    end

    describe '.host' do
      it 'returns the host of the viewing party', :vcr do
        jane = User.create!(name: 'Jane', email: 'eleven@upsidedown.com')
        dustin = User.create!(name: 'Dustin', email: 'hellfire@hawkins.edu')
        user_party1 = UserViewingParty.create!(user: dustin, viewing_party: @party1, hosting: true)
        user_party2 = UserViewingParty.create!(user: jane, viewing_party: @party1, hosting: false)

        expect(@party1.host).to eq(dustin)
        expect(@party1.host).to_not eq(jane)
      end
    end
  end
end
