require 'rails_helper'

RSpec.describe User, type: :model do

  xit 'exists' do
    expect(user_1).to be_instance_of(User)
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
  end

  describe 'relationships' do
    it { should have_many(:user_parties)}
    it { should have_many(:parties).through(:user_parties)}
  end

  describe 'class methods' do

  end
end



