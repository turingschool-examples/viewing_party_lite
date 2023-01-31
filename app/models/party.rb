class Party < ApplicationRecord
  has_many :user_parties
  has_many :users, through: :user_parties

  validates_presence_of :duration, :start_time
  # validate_presence_of :movie_id
end
