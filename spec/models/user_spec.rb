require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many(:party_users)}
    it { should have_many(:parties).through(:party_users)}
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    subject { User.new(name: "Sherman")}
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:password_confirmation) }
    it { should have_secure_password }
    it "will have a secure password" do
      user = User.create(name: "Sam", email: "sam@mail.com", password: "test", password_confirmation: "test")

      expect(user).not_to have_attribute(:password)
      expect(user.password_digest).not_to eq('test')
    end
  end
end
