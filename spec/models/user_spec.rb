require 'rails_helper'

RSpec.describe User, type: :model do
  decribe 'relationships' do
    it { should have_many(:party_users) }
    it { shoulld have_many(:parties).through(:party_users) }
  end
  
end