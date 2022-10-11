require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
    it { should have_secure_password }
  end

  describe 'relationships' do
    it { should have_many(:user_viewing_parties) }
    it { should have_many(:viewing_parties).through(:user_viewing_parties) }
  end

  describe 'instance methods' do
    it 'can downcase an email' do
      user = User.create!(
                    name: 'Mike',
                    email: 'MikeDao@fakemail.com',
                    password: 'password',
                    password_confirmation: 'password'
                  )

      expect(user.email).to eq('mikedao@fakemail.com')
    end
  end
end
