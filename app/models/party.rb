class Party < ApplicationRecord
  validates_presence_of :date
  validates_presence_of :time
  validates_presence_of :duration
  # belongs_to :movie
  has_many :user_parties
  has_many :users, through: :user_parties
end
