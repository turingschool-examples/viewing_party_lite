require 'rails_helper'

RSpec.describe ViewingParty, type: :model do
  describe 'validations' do
    it { should validate_presence_of :movie_id }
    it { should validate_presence_of :host_id }
    it { should validate_presence_of :duration }
    it { should validate_numericality_of :duration }
    it { should validate_presence_of :eventdate }
    it { should validate_presence_of :starttime }
  end

  describe 'relationships' do
    it { should have_many(:user_viewing_parties) }
    it { should have_many(:users).through(:user_viewing_parties) }
  end

  before :each do
    @user1 = User.create!(
      name: 'Saylor',
      email: 'SAyLoR@fakemail.COM',
      password: 'password',
      password_confirmation: 'password'
      )

    @user2 = User.create!(
      name: 'Sterling',
      email: 'sterling@fakemail.com',
      password: 'password',
      password_confirmation: 'password'
    )

    @user3 = User.create!(
      name: 'Coleman',
      email: 'dani@fakemail.com',
      password: 'password',
      password_confirmation: 'password'
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

    @user_party_1 = UserViewingParty.create!(
      user_id: @user1.id,
      viewing_party_id: @party1.id
    )
  end

  describe 'class methods' do
  end

  describe 'instance methods' do
    it 'lists users who are not host as attendees' do
      expect(@party1.attendees).to eq([@user2, @user3])
    end
  end
end
