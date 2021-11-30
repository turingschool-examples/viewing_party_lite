require "rails_helper"

RSpec.describe Party, type: :model do
  describe "relationship" do
    it { should belong_to(:user) }
    it { should belong_to(:movie) }
    it { should have_many(:user_parties) }
    it { should have_many(:users).through(:user_parties)}
  end

  describe "class methods" do
    xit "" do

    end
  end
end
