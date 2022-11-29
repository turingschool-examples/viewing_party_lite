require 'rails_helper'

RSpec.describe ViewingParty, type: :model do
  describe 'relationship' do
    it { should have_many :user_viewing_parties }
    it { should have_many(:users).through(:user_viewing_parties) }
  end

  describe 'validations' do
  end
end
