# frozen_string_literal: true

class Party < ApplicationRecord
  has_many :party_users
  has_many :users, through: :party_users
  validates_numericality_of :movie_id
  validates_presence_of :start_time
  validates_numericality_of :duration

  def hosting
    party_users.where(host: true)
  end

  def invited
    party_users.where(host: false)
  end
end
