require 'rails_helper'

RSpec.describe Party, :type => :model do
  describe 'associations' do
    it { should have_many(:user_parties)}
    it { should have_many(:users).through(:user_parties)}

  end
  describe 'validations' do
    it { should validate_presence_of(:event_start) }
    it { should validate_presence_of(:movie_id) }
  end
end
