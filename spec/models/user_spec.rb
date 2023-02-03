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
end