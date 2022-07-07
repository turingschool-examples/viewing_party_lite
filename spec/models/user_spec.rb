require 'rails_helper'

RSpec.describe User, type: :model do
  describe "relationships" do
    it { should have_many(:user_view_parties) }
    it { should have_many(:view_parties).through(:user_view_parties) }
  end

  describe "attributes" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
  end
end
