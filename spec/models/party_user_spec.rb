require 'rails_helper'

RSpec.describe PartyUser, type: :model do
  describe "validations" do
    it { should allow_value(%w(true false)).for(:host) }
    it { is_expected.not_to allow_value(nil).for(:host) }
  end
  describe "relationships" do
    it { should belong_to :party }
    it { should belong_to :user }
  end
end