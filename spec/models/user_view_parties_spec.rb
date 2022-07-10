require 'rails_helper'

RSpec.describe UserViewParty, type: :model do
  describe "relationships" do
    it { should belong_to(:user) }
    it { should belong_to(:view_party) }
  end

  describe "attributes" do
    it { should allow_value(true).for(:host) }
    it { should allow_value(false).for(:host) }
    it { should_not allow_value(nil).for(:host) }
  end
end
