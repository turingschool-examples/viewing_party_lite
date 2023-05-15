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

  let!(:user1) { User.create!(
                 name: 'Saylor',
                 email: 'SAyLoR@webmail.COM',
                 password: 'password',
                 password_confirmation: 'password'
                ) }
  let!(:users) { create_list(:user, 2) }
  let!(:user2) { users.first }
  let!(:user3) { users.second }

  let!(:party1) { ViewingParty.create!(
                  poster_path: 'test path',
                  movie_name: 'The First Movie',
                  movie_id: 123,
                  host_id: user1.id,
                  duration: 456,
                  eventdate: Date.tomorrow,
                  starttime: Time.current
                ) }
  let!(:party2) { ViewingParty.create!(
                  poster_path: 'test path number two',
                  movie_name: 'A Second Movie',
                  movie_id: 303,
                  host_id: user1.id,
                  duration: 405,
                  eventdate: Date.tomorrow,
                  starttime: Time.current
                ) }
  let!(:party3) { ViewingParty.create!(
                  poster_path: 'testing 123',
                  movie_name: 'A Third Movie!',
                  movie_id: 918,
                  host_id: user2.id,
                  duration: 720,
                  eventdate: Date.tomorrow,
                  starttime: Time.current
                ) }
  let!(:party4) { ViewingParty.create!(
                  poster_path: '/wAD7nnWh4e6wweffwmkLbf35uf0.jpg',
                  movie_name: 'Beverly Hills Ninja',
                  movie_id: 9622,
                  host_id: user3.id,
                  duration: 96,
                  eventdate: Date.yesterday,
                  starttime: Time.now
                ) }
  let!(:uvp1) { UserViewingParty.create!(
                user_id: user1.id,
                viewing_party_id: party1.id
               ) }
  let!(:uvp2) { UserViewingParty.create!(
                user_id: user2.id,
                viewing_party_id: party1.id
               ) }
  let!(:uvp3) { UserViewingParty.create!(
                user_id: user1.id,
                viewing_party_id: party2.id
               ) }
  let!(:uvp4) { UserViewingParty.create!(
                user_id: user2.id,
                viewing_party_id: party2.id
               ) }
  let!(:uvp5) { UserViewingParty.create!(
                user_id: user1.id,
                viewing_party_id: party3.id
               ) }
  let!(:uvp6) { UserViewingParty.create!(
                user_id: user2.id,
                viewing_party_id: party3.id
               ) }
  let!(:uvp7) { UserViewingParty.create!(
                user_id: user1.id,
                viewing_party_id: party4.id
               ) }
  let!(:uvp8) { UserViewingParty.create!(
                user_id: user2.id,
                viewing_party_id: party4.id
               ) }

  describe 'User attributes' do
    it 'ensures encryption of passwords' do

      expect(user1).to_not have_attribute(:password)
      expect(user1.password_digest).to_not eq('test')
    end
  end

  describe 'instance methods' do
    describe '.hosted_parties' do
      it 'returns all upcoming hosted parties for a User' do

        expect(user1.hosted_parties.count).to eq 2
        expect(user1.hosted_parties).to eq([party1, party2])
      end
    end

    describe '.invited_parties' do
      it 'returns all upcoming parties a user is invited to' do

        expect(user1.invited_parties.count).to eq 1
        expect(user1.invited_parties).to eq([party3])
        expect(user1.invited_parties).to_not include([party4])
      end
    end

    describe '.downcase_email' do
      it 'downcases an email when input' do

        expect(user1.email).to eq 'saylor@webmail.com'
      end
    end

    describe '.name_and_email' do
      it 'combines name and email' do

        expect(user1.name_and_email).to eq('Saylor (saylor@webmail.com)')
      end
    end
  end
end
