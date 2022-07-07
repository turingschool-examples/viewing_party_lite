require 'rails_helper'

RSpec.describe Party, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:duration)}
    it { should validate_presence_of(:date)}
    it { should validate_presence_of(:host)}
    it { should validate_presence_of(:movie)}
    it { should validate_presence_of(:movie_image)}
  end

  describe 'associations' do
    it { should have_many(:party_users)}
    it { should have_many(:users).through(:party_users)}
  end
end
