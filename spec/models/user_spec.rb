require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Relationships' do
    it { should have_many :viewing_partys }
    it { should have_many :attendees }
    it { should have_many(:viewing_partys).through(:attendees) }
  end

  describe 'Validations' do
    it { should validate_presence_of :user_name }
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
  end
end
