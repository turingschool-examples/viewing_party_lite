class Party < ApplicationRecord
  validates_presence_of :date, :duration, :start_time
  has_many :user_parties
  has_many :users, through: :user_parties
end