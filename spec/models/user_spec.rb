# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many :user_view_parties }
    it { should have_many(:view_parties).through(:user_view_parties) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should have_secure_password }
  end

  it 'should have a secure password' do 
    user = User.create!(name: 'Bob', email: 'bob@turing.edu', password: 'test123', password_confirmation: 'test123')

    expect(user).to_not have_attribute(:test)
    expect(user.password_digest).to_not eq('test123')
  end 
end
