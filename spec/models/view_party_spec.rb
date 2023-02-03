require 'rails_helper'

RSpec.describe ViewParty, type: :model do
  describe "validations" do
    it {should validate_presence_of :date}
    it {should validate_presence_of :time}
    it {should validate_presence_of :duration}
  end

  describe "relationships" do
    it {should belong_to :user}
    it {should have_many :party_guests}
  end
end