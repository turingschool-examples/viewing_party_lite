# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserParty, type: :model do
  describe 'relationships' do
    it { should belong_to(:party) }
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should define_enum_for(:host).with_values(%i[invited hosting]) }
  end
end
