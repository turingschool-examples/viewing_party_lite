require 'rails_helper'

RSpec.describe User do
  context 'validations' do
    it { should validate_presence_of :name } 
    it { should validate_presence_of :email } 
    it { should validate_uniqueness_of :email } 
  end

  context 'relationships' do
    it { should have_many :party_users }
  end
end
