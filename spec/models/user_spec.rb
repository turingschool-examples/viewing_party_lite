require 'rails_helper'

RSpec.describe User, type: :model do
  it 'exists' do
    user_1 = User.create!(name: 'John', email: 'x@user.com')
    expect(user_1).to be_instance_of(User)
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
  end

  describe 'relationships' do
    it { should have_many(:user_parties) }
    it { should have_many(:parties).through(:user_parties) }
  end

  describe 'class methods' do
  end
end
