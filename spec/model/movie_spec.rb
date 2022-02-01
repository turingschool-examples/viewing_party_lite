require 'rails_helper'

RSpec.describe Movie, type: :model do 
  describe 'relations' do 
    it { should have_many :cast_members}
    it { should have_many :reviews}
    it { should have_many :parties}
  end 

  describe 'validations' do 
    it { should validate_presence_of(:title)}
    it { should validate_presence_of(:vote_average)}
    it { should validate_presence_of(:run_time)}
    it { should validate_presence_of(:genre)}
    it { should validate_presence_of(:summary)}
  end 
end 