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
end