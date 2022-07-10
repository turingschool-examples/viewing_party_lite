class ViewingParty < ApplicationRecord
  has_many :party_users
  has_many :users, through: :party_users

  validates :duration, presence: true
  validates :date, presence: true
  validates :time, presence: true
end
