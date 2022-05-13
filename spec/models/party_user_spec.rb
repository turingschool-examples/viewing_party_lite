# frozen_string_literal: true

require 'rails_helper'

describe PartyUser do
  context 'relationships' do
    it { should belong_to :user }
    it { should belong_to :viewing_party }
  end
end
