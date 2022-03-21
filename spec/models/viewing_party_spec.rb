require 'rails_helper'

RSpec.describe ViewingParty do 
    describe 'associations' do 
        it { should belong_to(:user) }
        it { should have_many(:user_viewing_parties) }
        it { should have_many(:users).through(:user_viewing_parties) }
        end
end