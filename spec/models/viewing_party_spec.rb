require 'rails_helper'

RSpec.describe ViewingParty, type: :model do
  describe 'Associations' do
    it { should have_many(:user_viewing_parties) }
    it { should have_many(:users).through(:user_viewing_parties) }
  end

  describe 'Validations' do
    it { should validate_numericality_of(:duration) }
    it { should validate_presence_of(:movie_id) }
    it { should validate_presence_of(:start_time) }
    it { should validate_presence_of(:date) }
  end
end