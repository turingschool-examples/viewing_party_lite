# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ViewParty, type: :model do
  describe 'relationships' do
    it { should have_many(:user_view_parties) }
    it { should have_many(:users).through(:user_view_parties) }
  end

  describe 'validations' do
    it { should validate_presence_of(:movie_id) }
    it { should validate_presence_of(:movie_name) }
    it { should validate_presence_of(:duration) }
    it { should validate_presence_of(:datetime) }
  end
end
