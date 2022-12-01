require 'rails_helper'

RSpec.describe Party, type: :model do
  describe 'relationships' do
    it { should have_many :party_users }
    it { should have_many(:users).through(:party_users) }
  end

  describe 'instance methods' do
    before :each do
      @user1 = User.create!(name: Faker::Name.unique.name, email: Faker::Internet.unique.free_email)
      @user2 = User.create!(name: Faker::Name.unique.name, email: Faker::Internet.unique.free_email)
      @user3 = User.create!(name: Faker::Name.unique.name, email: Faker::Internet.unique.free_email)
      @user4 = User.create!(name: Faker::Name.unique.name, email: Faker::Internet.unique.free_email)

      @party1 = Party.create!(date: (DateTime.now + rand(90).days), start_time: "#{rand(1..24)}:00", movie_title: "Up", duration: (240 + rand(30)))
      @party2 = Party.create!(date: (DateTime.now + rand(90).days), start_time: "#{rand(1..24)}:00", movie_title: "Alien", duration: (240 + rand(30)))
      @party3 = Party.create!(date: (DateTime.now + rand(90).days), start_time: "#{rand(1..24)}:00", movie_title: "Whiplash", duration: (240 + rand(30)))
      @party4 = Party.create!(date: (DateTime.now + rand(90).days), start_time: "#{rand(1..24)}:00", movie_title: "Toy Story", duration: (240 + rand(30)))
      @party5 = Party.create!(date: (DateTime.now + rand(90).days), start_time: "#{rand(1..24)}:00", movie_title: "Brave", duration: (240 + rand(30)))
      
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
    describe '.invited_users' do
      it 'retrieves the names all users invited to the party excluding the host' do
        expect(@party1.invited_users).to eq([@user2.name, @user3.name])
      end
    end
    describe '.host' do
      it 'retrieves the name of the host' do
        expect(@party1.host).to eq(@user1.name)
      end
    end
  end
end
