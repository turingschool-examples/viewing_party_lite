class Party < ApplicationRecord
  has_many :user_parties
  has_many :users, through: :user_parties
  validates :start_time, :date, :duration, presence: true
end
