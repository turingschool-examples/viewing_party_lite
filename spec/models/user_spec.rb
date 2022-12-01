require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many :party_users }
    it { should have_many(:parties).through(:party_users) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
  end

  describe 'instance methods' do
    before :each do
      @user1 = User.create!(name: Faker::Name.unique.name, email: Faker::Internet.unique.free_email)
      @user2 = User.create!(name: Faker::Name.unique.name, email: Faker::Internet.unique.free_email)
      @user3 = User.create!(name: Faker::Name.unique.name, email: Faker::Internet.unique.free_email)
      @user4 = User.create!(name: Faker::Name.unique.name, email: Faker::Internet.unique.free_email)

      @party1 = Party.create!(date: (Date.new + rand(90).days), start_time: "#{rand(1..24)}:00", movie_title: "Up", duration: (240 + rand(30)))
      @party2 = Party.create!(date: (Date.new + rand(90).days), start_time: "#{rand(1..24)}:00", movie_title: "Alien", duration: (240 + rand(30)))
      @party3 = Party.create!(date: (Date.new + rand(90).days), start_time: "#{rand(1..24)}:00", movie_title: "Whiplash", duration: (240 + rand(30)))
      @party4 = Party.create!(date: (Date.new + rand(90).days), start_time: "#{rand(1..24)}:00", movie_title: "Toy Story", duration: (240 + rand(30)))
      @party5 = Party.create!(date: (Date.new + rand(90).days), start_time: "#{rand(1..24)}:00", movie_title: "Brave", duration: (240 + rand(30)))
      
      @party_user1 = PartyUser.create!(user_id: @user1.id, party_id: @party1.id, host: true)
      @party_user2 = PartyUser.create!(user_id: @user1.id, party_id: @party2.id, host: true)
      @party_user3 = PartyUser.create!(user_id: @user1.id, party_id: @party3.id, host: false)
      @party_user4 = PartyUser.create!(user_id: @user1.id, party_id: @party4.id, host: false)

      @party_user5 = PartyUser.create!(user_id: @user2.id, party_id: @party3.id, host: true)
      @party_user6 = PartyUser.create!(user_id: @user3.id, party_id: @party4.id, host: true)
  
      @party_user7 = PartyUser.create!(user_id: @user2.id, party_id: @party1.id, host: false)
      @party_user8 = PartyUser.create!(user_id: @user2.id, party_id: @party2.id, host: false)
      @party_user9 = PartyUser.create!(user_id: @user3.id, party_id: @party1.id, host: false)
      @party_user10 = PartyUser.create!(user_id: @user3.id, party_id: @party3.id, host: false)
  
      @party_user11 = PartyUser.create!(user_id: @user4.id, party_id: @party5.id, host: true)
      @party_user12 = PartyUser.create!(user_id: @user3.id, party_id: @party5.id, host: false)
    end
    describe '.parties_invited_to' do
      it 'should retrieve all of the parties the user has been invited to' do
        expect(@user1.parties_invited_to).to eq([@party3, @party4])
      end
    end
    describe '.parties_hosting' do
      it 'should retrieve all of the parties the user is hosting' do
        expect(@user1.parties_hosting).to eq([@party1, @party2])
      end
    end
  end
end
