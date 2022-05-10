require 'rails_helper'

RSpec.describe Party, type: :model do
  it "relationships" do
    should have_many(:user_parties)
    should have_many(:users).through(:user_parties)
  end

  it "validations" do
    should validate_presence_of(:host_id)
    should validate_presence_of(:date)
    should validate_presence_of(:duration)
  end
end