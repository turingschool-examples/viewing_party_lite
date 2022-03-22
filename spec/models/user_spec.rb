require 'rails_helper'

RSpec.describe User, type: :model do

  describe "relationships" do
    it {have_many(:party_users)}
    it {have_many(:parties).through(:party_users)}
  end

  describe "validations" do

  end
end
