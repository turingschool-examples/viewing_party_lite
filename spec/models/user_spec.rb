# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :password_digest}
    it { should have_secure_password :password }

    it 'does not store password in database' do
      user = User.create(name: 'bob', email: 'bob@bob', password: 'test123', password_confirmation: 'test123')
      expect(user).to_not have_attribute(:password)
      expect(user.password_digest).to_not eq('test123')

    end
  end
  describe 'relationships' do
    it { should have_many :party_users }
    it { should have_many(:parties).through(:party_users) }
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
      expect(@eli.hosting).to eq([@ef])
      expect(@sunny.hosting).to eq([@sm])
      expect(@john.hosting).to eq([])
    end

    it 'can find invited party users' do
      expect(@eli.invited).to eq([@em])
      expect(@sunny.invited).to eq([@sf])
      expect(@john.invited).to eq([@jf])
    end
  end
end
