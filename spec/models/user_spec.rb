require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of (:name) }
    it { should validate_presence_of (:email) }
  end

  describe 'relationships' do
    it { should have_many(:party_users) }
    it { should have_many(:parties).through(:party_users) }
  end

  describe 'class methods' do
    it '#email_list' do
      user_1 = User.create!(name: 'Will', email: 'abc@mail.com')
      user_2 = User.create!(name: 'Craig', email: 'zyx@mail.com')
      user_3 = User.create!(name: 'Alicia', email: '321@mail.com')

      expect(User.email_list).to eq([user_1.email, user_2.email, user_3.email])
    end
  end
end
