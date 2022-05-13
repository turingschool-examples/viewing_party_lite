# frozen_string_literal: true

class PartyUser < ApplicationRecord
  belongs_to :user
  belongs_to :viewing_party
end
