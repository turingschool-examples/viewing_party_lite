# frozen_string_literal: true

class PartyUser < ApplicationRecord
  belongs_to :party
  belongs_to :user
  validates :host, inclusion: { in: [true, false] }
end
