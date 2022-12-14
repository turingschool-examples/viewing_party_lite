# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { is_expected.to have_many(:user_view_parties) }
    it { is_expected.to have_many(:view_parties).through(:user_view_parties) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email) }
    it { is_expected.to have_secure_password }
  end

  describe 'User creation' do
    it 'should not have an attribute of password or a value of that actual password' do
      user = create(:user)
      expect(user).to_not have_attribute(:password)
      expect(user.password_digest).to_not eq('password123')
    end

    it 'downcases emails upon creation' do
      user = create(:user, email: 'UsEr@user.COM')
      expect(user.email).to eq('user@user.com')
    end
  end

  describe 'class methods' do
    describe '.default_users' do
      it 'returns default users only' do
        create_list(:user, 9)
        create_list(:user, 5, role: 1)
        expect(User.default_users.count).to eq(9)
      end
    end
  end
end
