require 'rails_helper'

RSpec.describe User do
  describe 'relationships' do
    it { should have_many(:party_users) }
    it { should have_many(:viewing_parties).through(:party_users) }
  end

  describe 'validations' do
    it { should validate_presence_of :email }
    it { should validate_presence_of :name }
    it { should validate_presence_of :password }
    it { should validate_presence_of :password_confirmation }
  end
end
