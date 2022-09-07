require 'rails_helper'

RSpec.describe PartyUser do
  describe 'relationships' do
    it { should belong_to :user }
    it { should belong_to :viewing_party }
  end
end