require 'rails_helper'

RSpec.describe UserViewingParty, type: :model do
  describe 'relationships' do
    it { should belong_to :user }
    it { should belong_to :viewing_party }
  end

  describe 'validations' do
    it { should validate_presence_of(:host) }
  end
end
