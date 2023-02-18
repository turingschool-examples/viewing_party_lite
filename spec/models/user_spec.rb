require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
    it { should validate_presence_of :password_digest }
    it { should have_secure_password }
  end

  describe 'relationships' do
    it { should have_many(:user_viewing_parties) }
    it { should have_many(:viewing_parties).through(:user_viewing_parties) }
  end

  before :each do
    @user1 = User.create!(
      name: 'Saylor',
      email: 'SAyLoR@webmail.COM',
      password: 'password',
      password_confirmation: 'password'
      )

    @user2 = User.create!(
      name: 'Sterling',
      email: 'sterling@webmail.com',
      password: 'password',
      password_confirmation: 'password'
    )

    @user3 = User.create!(
      name: 'Coleman',
      email: 'dani@webmail.com',
      password: 'password',
      password_confirmation: 'password'
    )

    @party1 = ViewingParty.create!(
      poster_path: 'test path',
      movie_name: 'The First Movie',
      movie_id: 123,
      host_id: @user1.id,
      duration: 456,
      eventdate: Date.today,
      starttime: Time.current
    )

    @party2 = ViewingParty.create!(
      poster_path: 'test path number two',
      movie_name: 'A Second Movie',
      movie_id: 303,
      host_id: @user1.id,
      duration: 405,
      eventdate: Date.today,
      starttime: Time.current
    )

    @party3 = ViewingParty.create!(
      poster_path: 'testing 123',
      movie_name: 'A Third Movie!',
      movie_id: 918,
      host_id: @user2.id,
      duration: 720,
      eventdate: Date.today,
      starttime: Time.current
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

  describe 'User attributes' do
    it 'ensures encryption of passwords' do

      expect(@user1).to_not have_attribute(:password)
      expect(@user1.password_digest).to_not eq('test')
    end
  end

  describe 'class methods' do
  end

  describe 'instance methods' do
    let!(:party4) { ViewingParty.create!(
                    poster_path: '/wAD7nnWh4e6wweffwmkLbf35uf0.jpg',
                    movie_name: 'Beverly Hills Ninja',
                    movie_id: 9622,
                    host_id: @user3.id,
                    duration: 96,
                    eventdate: Date.yesterday,
                    starttime: Time.now) }
    let!(:up5) { UserViewingParty.create!(
                 user_id: @user1.id,
                 viewing_party_id: party4.id) }

    let!(:up6) { UserViewingParty.create!(
                 user_id: @user2.id,
                 viewing_party_id: party4.id) }

    it 'can return all upcoming hosted parties for a User' do

      expect(@user1.hosted_parties.count).to eq 2
      expect(@user1.hosted_parties).to eq([@party1, @party2])
    end

    it 'can return all upcoming parties a user is invited to' do

      expect(@user1.invited_parties.count).to eq 1
      expect(@user1.invited_parties).to eq([@party3])
      expect(@user1.invited_parties).to_not include([party4])
    end

    it 'can downcase an email when input' do

      expect(@user1.email).to eq 'saylor@webmail.com'
    end

    it 'can combine name and email' do

      expect(@user1.name_and_email).to eq('Saylor (saylor@webmail.com)')
    end
  end
end
