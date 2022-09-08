require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should have_secure_password }
  end

  describe 'relationships' do
    it { should have_many(:viewing_parties) }
    it { should have_many(:viewing_parties).through(:viewing_party_users)}
  end

  before :each do

  end

  describe 'class methods' do

  end

  describe 'instance methods' do

  end
end
