require 'rails_helper'

RSpec.describe Party, type: :model do
  describe 'attributes' do
    it { should validate_presence_of(:host_id)}
    it { should validate_presence_of(:movie_id)}
    it { should validate_presence_of(:movie_name)}
    it { should validate_presence_of(:duration)}
    it { should validate_presence_of(:date)}
    it { should validate_presence_of(:time)}
  end

  describe 'relationships' do
    it { should have_many(:party_people)}
    it { should have_many(:people).through(:party_people)}
  end
end
