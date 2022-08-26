require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
    it { should have_secure_password }
  end

  describe 'relationships' do
    it { should have_many(:user_viewing_parties) }
    it { should have_many(:viewing_parties).through(:user_viewing_parties) }
  end

  before :each do
    @user1 = User.create!(
        name: "Blake Saylor",
        email: "blAkESAyLoR@gmail.COM",
        password_digest: "test"
      )

    @user2 = User.create!(
      name: "Anna Marie Sterling",
      email: "annamarie@gmail.com",
      password_digest: "test2"
    )

    @party1 = ViewingParty.create!(
      poster_path: 'test path',
      movie_name: 'The Shawshank Redemption',
      movie_id: 123,
      host_id: @user1.id,
      duration: 456,
      eventdate: Date.today,
      starttime: Time.now
    )

    @party2 = ViewingParty.create!(
      poster_path: 'test path number two',
      movie_name: 'A Second Movie',
      movie_id: 303,
      host_id: @user1.id,
      duration: 405,
      eventdate: Date.today,
      starttime: Time.now
    )

    @party3 = ViewingParty.create!(
      poster_path: 'testing 123',
      movie_name: 'A Third Movie!',
      movie_id: 918,
      host_id: @user2.id,
      duration: 720,
      eventdate: Date.today,
      starttime: Time.now
    )

    @user_party_1 = UserViewingParty.create!(
      user_id: @user1.id,
      viewing_party_id: @party1.id
    )
    @user_party_2 = UserViewingParty.create!(
      user_id: @user2.id,
      viewing_party_id: @party1.id
    )

    @user_party_3 = UserViewingParty.create!(
      user_id: @user1.id,
      viewing_party_id: @party2.id
    )
    @user_party_4 = UserViewingParty.create!(
      user_id: @user2.id,
      viewing_party_id: @party2.id
    )

    @user_party_5 = UserViewingParty.create!(
      user_id: @user1.id,
      viewing_party_id: @party3.id
    )
    @user_party_6 = UserViewingParty.create!(
      user_id: @user2.id,
      viewing_party_id: @party3.id
    )
  end

  describe 'class methods' do
  end

  describe 'instance methods' do
    it 'can return all hosted parties for a User' do
      expect(@user1.hosted_parties.count).to eq 2
      expect(@user1.hosted_parties).to eq [@party1, @party2]
    end

    it 'can return all parties a user is invited to' do
      expect(@user1.invited_parties.count).to eq 1
      expect(@user1.invited_parties).to eq [@party3]
    end

    it 'can downcase an email when input' do
      expect(@user1.email).to eq "blakesaylor@gmail.com"
    end
  end
end
