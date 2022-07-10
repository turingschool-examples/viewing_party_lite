require 'rails_helper'

RSpec.describe PartyUser, type: :model do
  decribe 'relationships' do
    it { should belong_to(:party) }
    it { should belong_to(:user) }
  end

 
end