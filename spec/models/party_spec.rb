require 'rails_helper'

RSpec.describe Party, type: :model do
  it 'exists' do
    party_1 = Party.create!(duration: 95, date: '12-31-22', start_time: '7:35p', movie_id: 1)
    expect(party_1).to be_instance_of(Party)
  end

  describe 'validations' do
    # it { should validate_presence_of(:duration) }
    it { should validate_numericality_of(:duration) }
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:start_time) }
    it { should validate_presence_of(:movie_id) }
  end

  describe 'relationships' do
    it { should have_many(:user_parties) }
    it { should have_many(:users).through(:user_parties) }
  end
end
