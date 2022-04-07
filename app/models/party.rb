class Party < ApplicationRecord
  has_many :user_parties
  has_many :users, through: :user_parties

  validates_presence_of :date
  validates_presence_of :time
  validates_presence_of :length
end
