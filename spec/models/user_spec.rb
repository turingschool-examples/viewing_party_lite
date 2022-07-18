require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Relationships' do
    it { should have_many :viewing_partys }
    it { should have_many :attendees }
    it { should have_many(:viewing_partys).through(:attendees) }
  end

  describe 'Validations' do
    it { should validate_presence_of :user_name }
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :password_digest}
    it { should have_secure_password }

    it 'has secure password' do
      user = User.create(user_name: 'Bob', email: 'bob@bob.com', password: 'bobrules', password_confirmation: 'bobrules')
      expect(user).to_not have_attribute(:password)
      expect(user.password_digest).to_not eq('bobrules')
    end
  end
end
