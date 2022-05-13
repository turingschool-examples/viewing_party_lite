require 'rails_helper'

RSpec.describe PartyUser, type: :model do
  describe 'relationships' do
    it { should belong_to(:party)}
    it { should belong_to(:user)}
  end

  describe 'validations' do
    it { should allow_value(%w(true false)).for(:host) }
  end

end
