require 'rails_helper'

RSpec.describe Party, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:duration)}
    it { should validate_presence_of(:host)}
    it { should validate_presence_of(:host_name)}
    it { should validate_presence_of(:movie_id)}
    it { should validate_presence_of(:start_time)}

  end

  describe 'associations' do
    it { should have_many(:party_users)}
    it { should have_many(:users).through(:party_users)}
  end
end
