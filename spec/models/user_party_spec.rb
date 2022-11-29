require 'rails_helper'

RSpec.describe UserParty do 
  describe 'validations' do 

    it { should validates_presence_of :user_status }
    it { should validates_presence_of :user_id }
    it { should validates_presence_of :viewing_party_id }
  end

  describe 'relationships' do 

    it { should belong_to :user }
    it { should belong_to :viewing_party }
  end
end