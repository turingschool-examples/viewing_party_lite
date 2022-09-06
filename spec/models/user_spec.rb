require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:password_digest) }

    it 'encrpyts a users password' do
      user = User.create!(name: 'Ben', email: 'ben@test.com', password: '123456', password_confirmation: '123456')
      expect(user).to_not have_attribute(:password)
      expect(user.password_digest).to_not eq('123456')
    end
  end

  describe 'relationships' do
    it { should have_many(:user_parties) }
    it { should have_many(:parties) }
    it { should have_many(:parties).through(:user_parties) }
  end

  it 'lists parties this person is invited to' do
      user_1 = User.create!(name: "Bryan", email: "bryan@bryan.com", password: '123456', password_confirmation: '123456')
      user_2 = User.create!(name: "Ben", email: "ben@ben.com", password: '123456', password_confirmation: '123456')
      party_1 = Party.create!(user_id: user_1.id, duration: 20, when: '2022-08-22', start_time: '12:00', movie_id: 520)
      party_2 = Party.create!(user_id: user_2.id, duration: 30, when: '2022-08-20', start_time: '13:00', movie_id: 300)
      party_3 = Party.create!(user_id: user_1.id, duration: 40, when: '2022-08-24', start_time: '14:00', movie_id: 300)

      user_1.user_parties.create!(party_id: party_1.id, user_id: user_1.id)
      user_1.user_parties.create!(party_id: party_3.id, user_id: user_1.id)

      expect(user_1.hosting).to eq([party_1, party_3])

  end
end
