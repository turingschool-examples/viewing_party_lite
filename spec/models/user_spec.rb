require 'rails_helper'

RSpec.describe User do
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should have_secure_password }
  end

  describe 'relationships' do
    it { should have_many(:user_viewing_parties) }
    it { should have_many(:viewing_parties).through(:user_viewing_parties)}
  end

  describe 'creating a user' do
    it 'should be able to create a user with a password' do
      user = User.create(name: 'Meg', email: 'meg@test.com', password: 'password123', password_confirmation: 'password123')

      expect(user).to_not have_attribute :password
      expect(user.password_digest).to_not eq 'password123'
    end
  end
end
