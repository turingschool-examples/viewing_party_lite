require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'Associations' do
    it { should have_many(:actor_movies) }
    it { should have_many(:actors).through(:actor_movies) }
    it { should have_many(:reviews) }
    it { should have_many(:viewing_parties) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:title) }
    it { should validate_numericality_of(:runtime) }
    it { should validate_numericality_of(:vote_average) }
    it { should validate_presence_of(:summary) }
  end
end