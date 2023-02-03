require 'rails_helper'

RSpec.describe User do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
  end

  describe 'associations' do
    it {should have_many(:invitees)}
    it {should have_many(:viewing_parties).through(:invitees)}
  end

  describe '#host?' do
    it 'does' do
      user = User.create!(name: "John Cena", email: "John@email.com")
      viewing_party1 = ViewingParty.create!(when: "11/21/2030 7:00", duration: 90, start_time: "7:00", movie_id: 550)
      Invitee.create!(user_id: user.id, viewing_party_id: viewing_party1.id, host: true)
      viewing_party2 = ViewingParty.create!(when: "11/21/2030 7:00", duration: 90, start_time: "7:00", movie_id: 550)
      Invitee.create!(user_id: user.id, viewing_party_id: viewing_party2.id, host: false)

      expect(user.host?(viewing_party1.id)).to eq(true)
      expect(user.host?(viewing_party2.id)).to eq(false)
    end
  end
end