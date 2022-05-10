require 'rails_helper'

RSpec.describe Party, type: :model do
  describe 'validations' do

    it { should validate_presence_of :duration }
    it { should validate_presence_of :when }
    it { should validate_presence_of :start_time} 

  end 
end 