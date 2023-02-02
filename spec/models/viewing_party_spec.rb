require 'rails_helper'

RSpec.describe ViewingParty, type: :model do
  describe 'relations' do
    it { should belong_to(:host) }
    it { should have_many :viewing_party_users }
    it { should have_many(:users).through(:viewing_party_users) }
  end

  describe '#movie' do
    it 'returns a movie object' do
      vp = create(:viewing_party)
      expect(vp.movie).to be_a Movie
    end
  end
end
