require 'rails_helper'

RSpec.describe ViewingParty, type: :model do
  describe 'validations' do
    it { should validate_presence_of :movie_title }
    it { should validate_presence_of :duration }
    it { should validate_presence_of :date }
    it { should validate_numericality_of(:duration).is_greater_than 0 }
  end

  describe 'relationship' do
    it { should have_many :user_parties }
    it { should have_many(:users).through(:user_parties) }
  end

  let!(:user1) { create(:user) }
  let!(:user2) { create(:user) }
  let!(:user3) { create(:user) }
  let!(:party1) { create(:viewing_party, date: 'Tue, 06 Dec 2022 21:52:00 UTC +00:00') }
  let!(:user_party1) { create(:user_party, user_status: 0, user: user1, viewing_party: party1) }
  let!(:user_party2) { create(:user_party, user: user2, viewing_party: party1) }
  let!(:user_party3) { create(:user_party, user: user3, viewing_party: party1) }

  it 'can display time in correct format' do
    expect(party1.start_time).to eq('09:52 PM')
  end

  it 'can display the date in the correct format' do
    expect(party1.start_date).to eq('December 06, 2022')
  end

  it 'can tell if a user is hosting' do
    expect(party1.user_hosting_status(user1)).to eq('Hosting')
  end

  it 'can list everyone in a party' do
    expect(party1.attendees).to eq([user2.name, user3.name])
  end
end
