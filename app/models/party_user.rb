# frozen_string_literal: true

class PartyUser < ApplicationRecord
  belongs_to :party
  belongs_to :user

  before_create do
    party.host ||= user
    party.save!
  end
end
