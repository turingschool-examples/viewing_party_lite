require 'rails_helper'

RSpec.describe ViewingPartyUser, type: :model do

  describe 'relationships' do
    it { should belong_to(:viewing_party) }
    it { should belong_to(:user) }
  end

end
