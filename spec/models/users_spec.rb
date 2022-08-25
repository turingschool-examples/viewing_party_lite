require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_presence_of :email }
  end

  describe 'relationships' do
    it { should have_many :viewing_party_users }
    it { should have_many(:viewing_parties).through( :viewing_party_users) }
  end
  
  describe 'class methods' do 
    it 'returns all users by the current one' do 
      user1 = User.create!(first_name: "Homer", last_name: "Simpson", email:"name@test.com", created_at: Time.now, updated_at: Time.now)
      user2 = User.create!(first_name: "James", last_name: "Rock", email:"james@test.com", created_at: Time.now, updated_at: Time.now)
      user3 = User.create!(first_name: "Heidi", last_name: "Hello", email:"heidi@test.com", created_at: Time.now, updated_at: Time.now)
     
      expect(User.all_without_current_user(user1.id)).to eq([user2, user3])
    end 
  end 
end 