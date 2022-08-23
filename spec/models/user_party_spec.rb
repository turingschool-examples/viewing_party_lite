require 'rails_helper'

RSpec.describe UserParty do
  describe 'validations' do
    it { should validate_presence_of(:host)}
  end
end
