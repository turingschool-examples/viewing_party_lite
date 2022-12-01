require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many :viewing_party_users }
    it { should have_many(:viewing_parties).through(:viewing_party_users) }
    it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
  end

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :email}
  end
end
