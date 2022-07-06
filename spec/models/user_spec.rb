require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Relationships' do
    it { should have_many :attendees }
    it { should have_many(:viewing_partys).through(:attendees) }
  end
end
