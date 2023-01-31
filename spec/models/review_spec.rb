require 'rails_helper'

RSpec.describe Review, type: :model do
  describe 'Associations' do
    it { should belong_to(:movie) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:author) }
    it { should validate_presence_of(:text) }
  end
end