# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relations' do
    it { should have_many :viewing_party_users }
    it { should have_many(:hosted_parties) }
    it { should have_many(:invited_parties).through(:viewing_party_users) }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
  end

  describe 'model tests' do
    it 'returns the users name and email' do
      user = User.create(name: 'River', email: 'river@gmail.com')

      expect(user.display_name).to eq('River (river@gmail.com)')
    end
  end
end
