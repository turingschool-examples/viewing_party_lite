# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserViewParty, type: :model do
  describe 'relationships' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:view_party) }
  end
end
