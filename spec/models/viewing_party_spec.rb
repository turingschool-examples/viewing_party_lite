require 'rails_helper'

RSpec.describe ViewingParty, type: :model do
  describe 'validations' do
    it { should validate_presence_of :movie_title }
    it { should validate_presence_of :duration }
    it { should validate_presence_of :date }
    it { should validate_presence_of :start_time }
    it { should validate_numericality_of(:duration).is_greater_than 0 }
  end

  describe 'relationship' do
    it { should have_many :user_parties }
    it { should have_many(:users).through(:user_parties) }
  end
end
