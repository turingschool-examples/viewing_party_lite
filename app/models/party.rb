class Party < ApplicationRecord
  has_many :party_users
  has_many :users, through: :party_users

  validates_presence_of :duration
  validates_presence_of :date
  validates_presence_of :start_time
end
