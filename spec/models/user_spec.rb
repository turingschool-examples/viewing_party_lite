require 'rails_helper'

describe User, type: :model do
  describe 'relationships' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
    it { should have_many :view_parties }
    it { should have_many :invites }
  end
end
