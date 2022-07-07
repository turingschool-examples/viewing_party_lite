require 'rails_helper'

RSpec.describe ViewingParty do
  describe 'relationships' do
    it { should have_many(:user_viewing_parties)}
    it { should have_many(:users).through(:user_viewing_parties) }
  end
end
