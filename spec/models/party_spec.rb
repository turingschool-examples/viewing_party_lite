# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Party, type: :model do
  describe 'validations' do
    it { should validate_numericality_of :movie_id }
    it { should validate_presence_of :movie_title }
    it { should validate_presence_of :start_time }
    it { should validate_numericality_of :duration }
  end
  describe 'relationships' do
    it { should have_many :party_users }
    it { should have_many(:users).through(:party_users) }
  end

  describe 'class methods' do
    before :each do
      @eli = User.create!(name: 'Eli', email: 'es@g', password: 'test123')
      @sunny = User.create!(name: 'Sunny', email: 'sm@g', password: 'test456')
      @john = User.create!(name: 'John', email: 'jc@g', password: 'test789')

      @frozen = Party.create!(movie_id: 109_445, movie_title: 'Frozen', start_time: '2022-12-25 06:30:00 UTC',
                              duration: 90)
      @moana = Party.create!(movie_id: 2_277_834, movie_title: 'Moana', start_time: '2022-12-31 12:00:00 UTC',
                             duration: 120)

      @ef = PartyUser.create!(party: @frozen, user: @eli, host: true)
      @sf = PartyUser.create!(party: @frozen, user: @sunny, host: false)
      @jf = PartyUser.create!(party: @frozen, user: @john, host: false)
      @sm = PartyUser.create!(party: @moana, user: @sunny, host: true)
      @em = PartyUser.create!(party: @moana, user: @eli, host: false)
    end

    it 'can find hosted party users' do
      expect(@frozen.hosting).to eq([@ef])
      expect(@moana.hosting).to eq([@sm])
    end

    it 'can find invited party users' do
      expect(@frozen.invited).to eq([@sf, @jf])
      expect(@moana.invited).to eq([@em])
    end
  end
end
