require 'rails_helper'

RSpec.describe CastMember, type: :model do 
  describe 'relations' do 
    it { should belong_to :movie }
  end 

  describe 'validations' do 
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:stage_name) }
  end 
end 