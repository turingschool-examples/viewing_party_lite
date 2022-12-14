# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ViewingPartyUser do
  describe 'Relationships' do
    it { should belong_to :user }
    it { should belong_to :viewing_party }
  end

  describe 'Validations' do
    it { should validate_presence_of :host }
    # it { should validate_inclusion_of(:host).in_array([true, false]) }
  end
end
