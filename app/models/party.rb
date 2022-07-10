# frozen_string_literal: true

class Party < ApplicationRecord
  has_many :party_users
  has_many :users, through: :party_users

  validates_presence_of :movie_id, :duration, :date, :start_time
end
