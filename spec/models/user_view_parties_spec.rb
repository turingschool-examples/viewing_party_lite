require 'rails_helper'

RSpec.describe UserViewParty, type: :model do
  describe "relationships" do
    it { should belong_to(:user) }
    it { should belong_to(:view_party) }
  end

  describe "attributes" do
    it { should validate_presence_of(:host) }
  end
end
