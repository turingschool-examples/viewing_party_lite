require 'rails_helper'

RSpec.describe ViewingParty, type: :model do
  describe 'relationships' do
   it { should belong_to(:host) } 
  end

  describe 'validations' do
    it { should validate_presence_of(:host) }
  end
end
