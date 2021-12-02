require "rails_helper"

RSpec.describe Model, type: :model do
  describe "validations" do
    it { should validate_presence_of :}
  end

  describe "relationships" do
    it {should belong_to :}
    it {should have_many :}
  end

  describe "instance methods" do
  end
end
