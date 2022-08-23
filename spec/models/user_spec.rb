require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:email) }
    it { should allow_value('sally@gmail.com').for(:email) }
    it { should_not allow_value('1234').for(:email) }
  end
end