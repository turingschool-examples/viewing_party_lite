require 'rails_helper'

RSpec.describe ViewParty, type: :model do
  describe 'relationships' do
    it {should have_many(:user_view_parties) }
    it {should have_many(:users).through(:user_view_parties) }
  end
end