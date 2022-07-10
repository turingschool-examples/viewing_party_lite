require 'rails_helper'

RSpec.describe Party, type: :model do
  decribe 'relationships' do
    it { should have_many(:party_users) }
    it { shoulld have_many(:users).through(:party_users) }
  end

end