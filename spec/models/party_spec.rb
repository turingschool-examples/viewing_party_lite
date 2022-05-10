require 'rails_helper'

RSpec.describe Party do
  describe 'relationships' do
    it { should have_many(:party_users) }
    it { should have_many(:users).through(:party_users) }
  end

  describe 'validations' do
    it { should validate_presence_of :date }
    it { should validate_presence_of :start_time }
  end
end
