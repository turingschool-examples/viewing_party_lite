require 'rails_helper'

RSpec.describe UserViewParty, type: :model do
  describe "relationships" do
    it { should belong_to :user }
    it { should belong_to :view_party }
  end
end