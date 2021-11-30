require "rails_helper"

RSpec.describe UserParty, type: :model do
  describe "relationship" do
    it { should belong_to(:user) }
    it { should belong_to(:party) }
  end

  describe "class methods" do
    xit "" do

    end
  end
end
