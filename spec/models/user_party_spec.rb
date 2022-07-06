require 'rails_helper'

RSpec.describe UserParty , type: :model do
  describe 'relationships' do
    it { should belong_to :user }
    it { should belong_to :party }
  end

  describe 'validatations' do
    it { should allow_value([true, false]).for :host }
    it { should_not allow_value(nil).for :host }
  end
end
