require 'rails_helper'

RSpec.describe ViewingParty, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:duration) }
  end

  describe 'relationships' do
    it { should belong_to(:user) }
    it { should have_many(:users).through(:viewing_party_users)}
  end

  before :each do

  end

  describe 'class methods' do

  end

  describe 'instance methods' do

  end
end
