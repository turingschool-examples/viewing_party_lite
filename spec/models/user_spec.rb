# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  describe 'associations' do
    it { should have_many(:viewing_parties) }
    it { should have_many(:user_viewing_parties) }
  end
end
