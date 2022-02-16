require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) {User.create!(name: 'Meg', email: 'meg@test.com', password: 'password123', password_confirmation: 'password123')}
  
  describe 'relations' do
    it { should have_many :user_parties }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should have_secure_password}
    it { should validate_presence_of(:status) }
  end

  it 'checks that user passwords attributres' do 
    expect(user).to_not have_attribute(:password)
    expect(user.password_digest).to_not eq('password123')
  end
end
