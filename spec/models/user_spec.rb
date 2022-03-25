require 'rails_helper'

RSpec.describe User do

  describe 'relationships' do
    it { should have_many(:party_users)}
    it { should have_many(:parties).through(:party_users)}
  end
end
