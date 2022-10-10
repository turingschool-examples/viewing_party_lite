class Party < ApplicationRecord
  has_many :user_parties
  has_many :users, through: :user_parties
  validates :start_time, presence: true
  validates :date, presence: true
  validates :duration, presence: true
end
