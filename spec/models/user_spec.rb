require 'rails_helper'

RSpec.describe User do
  describe 'relationships' do
    it { should have_many(:user_viewing_parties) }
    it { should have_many(:viewing_parties).through(:user_viewing_parties) }
  end

  describe 'validations' do
    it { should validate_uniqueness_of(:email) }
  end
end