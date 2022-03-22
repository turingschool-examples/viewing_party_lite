# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserViewingParty do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:viewing_party) }
  end
end
