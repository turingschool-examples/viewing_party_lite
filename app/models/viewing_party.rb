# frozen_string_literal: true

class ViewingParty < ApplicationRecord
  validates :date, presence: true
  validates :start_time, presence: true
  validates :duration, presence: true
  validates :movie_title, presence: true

  has_many :party_users
  has_many :users, through: :party_users
end
