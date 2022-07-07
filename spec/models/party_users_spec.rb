require 'rails_helper'

RSpec.describe PartyUsers, type: model do
    describe 'relationships' do 
        it { should have_many :users}
        it { should have_many :parties}
    end 
    
    describe 'validations' do 
    end
end