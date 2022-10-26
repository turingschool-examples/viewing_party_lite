require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many :user_parties }
    it { should have_many(:parties).through(:user_parties) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_uniqueness_of(:email) }
    it { should have_secure_password }
    it { should validate_presence_of(:password_digest)}
  end

  describe 'password characteristics' do
     it 'should not reveal a users password' do
      user = User.create(name: 'Alaina', email: 'alaina@test.com', password: 'password123', password_confirmation: 'password123')

      expect(user).to_not have_attribute(:password)
      expect(user.password_digest).to_not eq("password123")
     end
  end

  describe 'instance methods' do
    describe '#friends' do
     it 'can list all other users but themselves' do
      user1 = create(:user)
      user2 = create(:user)
      user3 = create(:user)
      user4 = create(:user)
      user5 = create(:user)

      expect(user1.friends.size).to eq(4)
      expect(user1.friends).to eq([user2, user3, user4, user5])
     end
    end
  end
end