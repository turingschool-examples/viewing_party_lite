require 'rails_helper' 

describe PartyUsers do 
  context 'relationships' do
    it { should belong_to :user }
    it { should belong_to :viewing_party } 
  end
end
