# frozen_string_literal: true

class ViewingParty < ApplicationRecord
  has_many :viewing_party_users
  has_many :users, through: :viewing_party_users

  validates_presence_of :movie_title
  validates_presence_of :duration
  validates_numericality_of :duration, greater_than: 0
  validates_presence_of :date
  validates_presence_of :start_time
end
