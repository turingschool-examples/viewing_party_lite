require "rails_helper"

describe Party, type: :model do
  describe "relationships" do
    it { should have_many(:invitations) }
    it { should have_many(:users).through(:invitations) }
  end
end
