require 'rails_helper'

RSpec.describe Actor, type: :model do
  describe 'Associations' do
    it { should have_many(:actor_movies) }
    it { should have_many(:movies).through(:actor_movies) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:name) }
  end
end