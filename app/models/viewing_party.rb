# frozen_string_literal: true

class ViewingParty < ApplicationRecord
  has_many :viewing_party_users
  has_many :users, through: :viewing_party_users

  validates_presence_of :movie_id, :date, :start_time, :duration
end
