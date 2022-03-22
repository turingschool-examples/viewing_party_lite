require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'relationships' do
    it { should have_many(:viewing_party_users) }
    it { should have_many(:viewing_parties).through(:viewing_party_users) }
  end

end
