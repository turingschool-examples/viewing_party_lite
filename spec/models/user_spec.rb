require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
  end
  describe "relationships" do
    it { should have_many :party_users }
    it { should have_many(:parties).through(:party_users) }
  end
end