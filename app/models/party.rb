class Party < ApplicationRecord
  validates_presence_of :duration
  validates_presence_of :date
  validates_presence_of :host
  validates_presence_of :movie_image
  validates_presence_of :movie

  has_many :party_users
  has_many :users, through: :party_users
end
