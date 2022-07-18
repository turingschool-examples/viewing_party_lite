# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many(:user_parties) }
    it { should have_many(:parties).through(:user_parties) }
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:email)}
    it { should have_secure_password }
  end
end
