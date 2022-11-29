# frozen_string_literal: true

class ViewingPartyUser < ApplicationRecord
  belongs_to :user
  belongs_to :viewing_party

  validates_presence_of :host
  validates_inclusion_of :host, in: [true, false]
end
