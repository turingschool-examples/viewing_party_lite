class Party < ApplicationRecord
  validates_presence_of :date, :time, :duration, :movie_id, :host

  has_many :party_users
  has_many :users, through: :party_users
end
