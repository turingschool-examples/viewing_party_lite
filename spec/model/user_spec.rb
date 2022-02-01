require 'rails_helper'

RSpec.describe User, type: :model do 
  describe 'relations' do 
    it { should have_many :user_parties }
    it { should have_many(:parties).through(:user_parties) }
  end 

  describe 'validations' do 
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:status) }
  end 
end 