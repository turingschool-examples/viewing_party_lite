class Party < ApplicationRecord
  has_many :user_parties
  has_many :users, through: :user_parties

  validates_presence_of :date
  validates_presence_of :start_time
  validates_presence_of :movie_id
end
