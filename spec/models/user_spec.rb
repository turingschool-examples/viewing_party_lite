require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name)}
    # figure out gem to validate email
  end

  describe 'relationships' do
    it { should have_many(:user_parties)}
    it { should have_many(:parties).through(:user_parties)}
  end
end
