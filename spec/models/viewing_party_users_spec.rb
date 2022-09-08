require 'rails_helper'

RSpec.describe ViewingPartyUser, type: :model do
  describe 'validations' do
    it { should define_enum_for(:status).with([:invited, :hosting]) }
  end

  describe 'relationships' do
    it { should belong_to :user }
    it { should belong_to :viewing_party }
  end
end 