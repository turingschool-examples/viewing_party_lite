require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
      @user1 = User.create!(first_name: "Homer", last_name: "Simpson", email:"name@test.com", created_at: Time.now, updated_at: Time.now, password: "test123", password_confirmation: "test123")
      @user2 = User.create!(first_name: "James", last_name: "Rock", email:"james@test.com", created_at: Time.now, updated_at: Time.now, password: "test123", password_confirmation: "test123")
      @user3 = User.create!(first_name: "Heidi", last_name: "Hello", email:"heidi@test.com", created_at: Time.now, updated_at: Time.now, password: "test123", password_confirmation: "test123")
      @user4 = User.create!(first_name: "Jimmy", last_name: "Delicious", email: "JD@test.org",created_at: Time.now, updated_at: Time.now, password: "test123", password_confirmation: "test123")
  end

  describe 'validations' do
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should have_secure_password }

    it 'should not have "password" attribute' do
      expect(@user4).to_not have_attribute(:password)
      expect(@user4.password_digest).to_not eq("test123")
    end
  end

  describe 'relationships' do
    it { should have_many :viewing_party_users }
    it { should have_many(:viewing_parties).through( :viewing_party_users) }
  end
  
  describe 'class methods' do 
    it 'returns all users by the current one' do 
      expect(User.all_without_current_user(@user1.id)).to eq([@user2, @user3, @user4])
    end 
  end 
end 