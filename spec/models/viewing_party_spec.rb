# frozen_string_literal: true

require 'rails_helper'

describe ViewingParty do
  context 'validations' do
    it { should validate_presence_of :date }
    it { should validate_presence_of :start_time }
    it { should validate_presence_of :duration }
    it { should validate_presence_of :movie_title }
  end

  context 'relationships' do
    it { should have_many :party_users }
  end
end
