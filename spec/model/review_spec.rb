require 'rails_helper'

RSpec.describe Review, type: :model do 
  describe 'relations' do 
    it { should belong_to :movie }
  end 

  describe 'validations' do 
    it { should validate_presence_of(:author) }
    it { should validate_presence_of(:critique) }
  end 
end 