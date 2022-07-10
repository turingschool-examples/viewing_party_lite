require 'rails_helper'

RSpec.describe ViewingParty, type: :model do
  describe 'Relationships' do
    it { should have_many :attendees }
    it { should have_many(:users).through(:attendees) }
  end

  describe 'Validations' do
    it { should validate_presence_of :movie }
    it { should validate_presence_of :date }
    it { should validate_presence_of :start_time }
    it { should validate_presence_of :duration }

  end
end
