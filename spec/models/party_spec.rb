require "rails_helper"

RSpec.describe Party, type: :model do
  describe "relationships" do
    it { should have_many :user_parties }
  end
end
