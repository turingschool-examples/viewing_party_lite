require 'rails_helper'

RSpec.describe User do
  describe 'relationships' do
    it { should have_many :party_users }
    it { should have_many(:parties).through(:party_users) }
    it {should validate_presence_of(:password)}
  end

    describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of(:email) }
    it {should validate_presence_of(:password)}
    it { should have_secure_password}
  end
end