class Party < ApplicationRecord
  validates :movie_id, presence: true
  validates :date, presence: true
  validates :start_time, presence: true
  validates :duration, presence: true
end
