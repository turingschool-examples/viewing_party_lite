# frozen_string_literal: true

class UserParty < ApplicationRecord
  belongs_to :user
  belongs_to :viewing_party

  validates_inclusion_of :host, in: [true, false]
end
