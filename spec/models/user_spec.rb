require 'rails_helper'

RSpec.describe User, type: :model do
    describe 'relationships' do
        it { should have_many :hosted_viewing_parties }
        it { should have_many :viewing_party_invitees }
        it { should have_many(:viewing_parties).through(:viewing_party_invitees) }
    end
end