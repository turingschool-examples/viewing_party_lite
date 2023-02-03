require 'rails_helper'

RSpec.describe ViewingPartyUser do
  describe 'relationships' do
    it { should belong_to :user }
    it { should belong_to :viewing_party }
  end

  describe 'validations' do
    it { should allow_value(true).for(:hosting) }
    it { should allow_value(false).for(:hosting) }
    it { should_not allow_value(nil).for(:hosting) }
  end
end
