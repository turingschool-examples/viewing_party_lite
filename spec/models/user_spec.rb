require 'rails_helper'

RSpec.describe User do
  describe 'associations' do
    it {should have_many(:invitees)}
    it {should have_many(:viewing_parties).through(:invitees)}
  end
end