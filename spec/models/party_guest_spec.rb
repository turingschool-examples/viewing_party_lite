require 'rails_helper'

RSpec.describe PartyGuest, type: :model do
  describe "validations" do
    it {should validate_presence_of :view_party_id}
    it {should validate_presence_of :guest_id}
  end

  describe "relationships" do
    it {should belong_to :view_party}
  end
end