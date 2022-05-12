require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email)}
    # it { should validate_uniqueness_of(:email).scoped_to(:id).with_message('** Email Already Exists **') }
  end
end
