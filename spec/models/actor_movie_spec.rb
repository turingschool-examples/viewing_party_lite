require 'rails_helper'

RSpec.describe ActorMovie, type: :model do
  describe 'Associations' do
    it { should belong_to(:actor) }
    it { should belong_to(:movie) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:character) }
  end
end