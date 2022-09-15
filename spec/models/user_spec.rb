require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :email }
    it { should have_secure_password }
  end
end
