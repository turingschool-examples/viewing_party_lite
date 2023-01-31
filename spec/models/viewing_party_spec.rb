require 'rails_helper'

RSpec.describe ViewingParty do
  describe 'associations' do
    it {should belong_to(:movie)}
    it {should belong_to(:user)}
    it {should have_many(:invitees)}
    it {should have_many(:users).through(:invitees)}
  end
end