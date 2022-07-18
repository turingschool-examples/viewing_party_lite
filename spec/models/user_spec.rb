require 'rails_helper'

RSpec.describe User do
  describe 'relationships' do
    it { should have_many(:party_users) }
    it { should have_many(:viewing_parties).through(:party_users) }
  end

  describe 'validations' do
    it { should validate_presence_of :email }
    it { should validate_presence_of :name }
    it { should validate_presence_of :password_digest }
    it { should have_secure_password }
  end

  describe 'when created' do
    it 'should not have a password or password confirmation attribute' do
      user = User.create!(name: 'Meg', email: 'meg@test.com', password: 'password123',
                          password_confirmation: 'password123')
      expect(user).to_not have_attribute(:password)
      expect(user.password_digest).to_not eq('password123')
    end
  end
end
