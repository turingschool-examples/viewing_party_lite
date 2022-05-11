require 'rails_helper'

RSpec.describe User, type: :model do
  it "relationships" do
    should have_many(:user_parties)
    should have_many(:parties).through(:user_parties)
  end

  it "validations" do
    should validate_presence_of(:name)
    should validate_presence_of(:email)
  end
end