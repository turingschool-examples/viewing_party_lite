require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many :user_parties }
    it { should have_many(:users).through(:user_parties) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:email)}
    it { should validate_uniqueness_of(:email)}
    it { should validate_presence_of(:username)}
    it { should validate_uniqueness_of(:username)}
    it { should validate_presence_of(:password)}
    it { should have_secure_password}
    it { should validate_presence_of(:password_digest)}
  end

  describe 'instance methods' do
    # #rails does automatically
    # xdescribe 'passwords_match?' do
    #   it 'checks if the password and password_confirmation match' do
    #     user_params = {
    #       "name"=>"Barbie", 
    #       "email"=>"barbiegal@gmail.com", 
    #       "username"=>"barbiedreamhouse13", 
    #       "password"=>"test", 
    #       "password_confirmation"=>"test"}
    #     user = User.create(user_params)
    #     expect(user.passwords_match?(user_params)).to eq(true)
    #   end
    # end
  end
end