require 'rails_helper'

RSpec.describe Party, type: :model do
  describe "relations" do
    it { should have_many(:user_parties)}
    it { should have_many(:users).through(:user_parties)}
    # it { should belong_to(:movies)} maybe? movies is an API unsure if we make table
  end
end
