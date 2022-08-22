class Party < ApplicationRecord
  validates_presence_of :movie_id
  validates_presence_of :movie_title
  validates_presence_of :duration
  validates_presence_of :date
  validates_presence_of :start_time

  has_many :user_parties
  has_many :user, through: :user_parties
end