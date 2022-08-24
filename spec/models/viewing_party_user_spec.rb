require 'rails_helper'

RSpec.describe ViewingPartyUser, type: :model do

  describe 'relationships' do
    it { should belong_to(:user) }
    it { should belong_to(:viewing_party) }
  end

  before :each do

  end

  describe 'class methods' do

  end

  describe 'instance methods' do

  end
end
