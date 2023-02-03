require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
  end

  describe 'class methods' do
    describe '.all_except' do
      it 'returns all users except the one specified' do
        user1,user2,user3 = create_list(:user, 3)

        expect(User.all_except(user1)).to eq([user2,user3])
      end
    end
  end

  describe 'instance methods' do
    describe '.name_and_email' do
      it 'returns string of user name_and_email' do
        user = create(:user, name: "Bob", email: "email@email.com")
        expect(user.name_and_email).to eq("Bob (email@email.com)")
      end
    end
  end
end