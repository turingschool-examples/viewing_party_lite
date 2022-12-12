# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many :user_parties }
    it { should have_many(:parties).through(:user_parties) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:password_digest)}
    it { should validate_presence_of(:password_confirmation)}
    it { should have_secure_password}
  end

  describe 'methods' do
    before :each do
      @user = User.create(name: 'Meg', email: 'meg@test.com', password: 'password123', password_confirmation: 'password123')
      @mostafa = User.create!(name: 'Mostafa', email: 'sasa2020@hotmail.com', password: 'test', password_confirmation: 'test')
      @yuji = User.create!(name: 'Yuji', email: 'yuyuhakusho2020@hotmail.com', password: 'test1', password_confirmation: 'test1')
      @bryan = User.create!(name: 'Bryan', email: 'breakingbad2020@hotmail.com', password: 'test2', password_confirmation: 'test2')

      @party_1 = @mostafa.parties.create!(movie_title: 'The Godfather', duration: 175, date: '12/1/2022',
                                          time: '19:00', host_id: @mostafa.id)
      @party_2 = @mostafa.parties.create!(movie_title: 'Young Adam', duration: 93, date: '12/4/2022', time: '18:00',
                                          host_id: @mostafa.id)
      @party_3 = @mostafa.parties.create!(movie_title: 'Natural Born Killers', duration: 118, date: '12/7/2022',
                                          time: '20:00', host_id: @mostafa.id)
      @party_4 = @yuji.parties.create!(movie_title: 'Pulp Fiction', duration: 154, date: '12/8/2022', time: '19:30',
                                       host_id: @yuji.id)
      @party_5 = @bryan.parties.create!(movie_title: 'Up', duration: 96, date: '12/8/2022', time: '17:00',
                                        host_id: @bryan.id)

      @yuji_party_1 = UserParty.create(user_id: @yuji.id, party_id: @party_1.id)
      @yuji_party_2 = UserParty.create(user_id: @yuji.id, party_id: @party_2.id)
      @bryan_party_1 = UserParty.create(user_id: @bryan.id, party_id: @party_1.id)
      @bryan_party_3 = UserParty.create(user_id: @bryan.id, party_id: @party_3.id)
      @mostafa_party_5 = UserParty.create(user_id: @mostafa.id, party_id: @party_5.id)
    end

    it 'can register a user' do


      expect(@user).to_not have_attribute(:password)
      expect(@user.password_digest).to_not eq('password123')
    end

    it 'has a method that finds all parties created by a user' do
      expect(@mostafa.hosted_parties).to eq([@party_1, @party_2, @party_3])
      expect(@bryan.hosted_parties).to eq([@party_5])
    end

    it 'has method that finds all parties a user has been invited to' do
      expect(@mostafa.invited_parties).to eq([@party_5])
      expect(@yuji.invited_parties).to eq([@party_1, @party_2])
      expect(@bryan.invited_parties).to eq([@party_1, @party_3])
    end
  end
end
