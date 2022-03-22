require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'attributes' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
  end

  describe 'relationships' do
      it { should have_many(:user_parties)}
      it { should have_many(:parties).through(:user_parties)}
  end

  describe 'methods below here' do

  end
end
