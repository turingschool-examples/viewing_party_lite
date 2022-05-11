require 'rails_helper'

RSpec.describe UserParty, type: :model do
  it "relationships" do
    should belong_to(:user)
    should belong_to(:party)
  end
end