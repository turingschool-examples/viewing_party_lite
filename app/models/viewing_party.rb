class ViewingParty < ApplicationRecord
  has_many :viewing_party_users
  has_many :users, through: :viewing_party_users

  validates_presence_of :movie, :duration, :date, :start_time
  validates_numericality_of :duration
end
