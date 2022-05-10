require 'rails_helper'

RSpec.describe Party, type: :model do
  describe 'validations' do

    it { should validate_presence_of :duration }
    it { should validate_presence_of :when }
    it { should validate_presence_of :start_time} 

  end 

  describe 'relationships' do

    it { should have_many :attendees }
    it { should belong_to :user }
    it { should have_many(:users).through(:attendees) }

  end 
end 