require 'rails_helper'

describe ViewParty, type: :model do
  describe 'relationships' do
    it { should belong_to :user }
    it { should belong_to :movie }
    it { should have_many :invites }
  end
end
