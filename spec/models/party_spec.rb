require 'rails_helper'

RSpec.describe Party do
  describe 'validations' do
    it { should validate_presence_of :duration }
    it { should validate_presence_of :date }
    it { should validate_presence_of :start_time }
    it { should validate_presence_of :name }
    it { should validate_presence_of :host_id }
  end

  describe 'relationships' do
    it { should have_many(:party_users) }
    it { should have_many(:users).through(:party_users) }
  end
end
