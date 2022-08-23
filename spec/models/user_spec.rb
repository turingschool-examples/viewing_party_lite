require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:name) }
  end

  describe 'relationships' do
    it { should have_many(:party_users) }
    it { should have_many(:viewing_parties).through(:party_users) }
  end
end

