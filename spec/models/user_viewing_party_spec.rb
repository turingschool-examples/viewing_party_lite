# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserViewingParty, type: :model do
  describe 'Relationships' do
    it { should belong_to :user }
    it { should belong_to :viewing_party }
  end
  describe 'Validations' do
    it { should validate_presence_of :user_id }
    it { should validate_presence_of :viewing_party_id }
    it { should validate_presence_of :role }
  end
end
