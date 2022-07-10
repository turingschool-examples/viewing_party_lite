require 'rails_helper'

RSpec.describe User, type: :model do
  decribe 'relationships' do
    it { should have_many(:party_users) }
    it { shoulld have_many(:parties).through(:party_users) }
  end

  describe 'validations' do
    it {should validate_presence_of :email}
    it {should validate_presence_of :name}
    it {should valideate_uniqueness_of :email}
  end
end