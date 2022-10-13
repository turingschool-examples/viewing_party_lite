# frozen_string_literal: true

class ViewingParty < ApplicationRecord
  validates_presence_of :duration, numericality: true
  validates_presence_of :date, :time, :host_id

  has_many :viewing_party_users
  has_many :users, through: :viewing_party_users
end
