require 'rails_helper'

RSpec.describe Movie do
  describe 'associations' do
    it {should have_many(:reviews)}
    it {should have_many(:movie_actors)}
    it {should have_many(:actors).through(:movie_actors)}
    it {should have_many(:viewing_parties)}
  end
end