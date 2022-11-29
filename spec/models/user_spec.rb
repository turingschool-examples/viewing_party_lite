require 'rails_helper'

RSpec.describe User do 
  describe 'validations' do 

    it { should validates_presence_of :user_name }
    it { should validates_presence_of :email }
  end

  describe 'relationships' do 
    it { should have_many :user_parties }
    it { should have_many(:viewing_parties).through(:user_parties) }
  end

  
end