require 'rails_helper'

RSpec.describe UserParty, type: :model do
  describe 'relationships' do 
    it { should belong_to :user }
    it { should belong_to :viewing_party }
  end
  
  describe 'validations' do 
    it { should validate_inclusion_of(:host).in?([true, false]) }
  end
end