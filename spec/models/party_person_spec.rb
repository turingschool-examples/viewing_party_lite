require 'rails_helper'

RSpec.describe PartyPerson, type: :model do
  describe 'relationships' do
    it { should belong_to(:party) }
    it { should belong_to(:person) }
  end
end
