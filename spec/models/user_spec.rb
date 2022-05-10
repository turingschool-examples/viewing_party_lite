require "rails_helper"

describe User, type: :model do
  describe "relationships" do
    it { should have_many(:invitations) }
    it { should have_many(:parties).through(:invitations) }
  end
end
