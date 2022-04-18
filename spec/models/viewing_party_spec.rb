require 'rails_helper'

RSpec.describe ViewingParty, type: :model do
  describe "relationships" do
     it { should have_many :user_viewing_parties }
     it { should have_many(:users).through(:user_viewing_parties) }
  end

  describe "attributes" do
    it { should validate_presence_of :movie_id }
    it { should validate_presence_of :host_id }
    it { should validate_presence_of :duration }
    it { should validate_presence_of :start_time }
    it { should validate_presence_of :date_time }
  end
end
