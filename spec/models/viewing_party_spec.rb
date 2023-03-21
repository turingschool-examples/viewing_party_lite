require 'rails_helper'

RSpec.describe ViewingParty, type: :model do
  describe 'validations' do
    it { should validate_presence_of :movie_id }
  end

  describe 'relationships' do
    it { should have_many :user_parties }
    it { should have_many(:users).through(:user_parties) }
  end
end