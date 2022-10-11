require 'rails_helper'

RSpec.describe UserParty, type: :model do

  xit 'exists' do
    expect(party_1).to be_instance_of(Party)
  end

  describe 'validations' do
    it { should validate_presence_of(:host_status) }
  end
end