# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Relationships' do
    it { should have_many :user_viewing_parties }
  end
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :password_digest }
    it { should validate_presence_of :email }
  end
end
