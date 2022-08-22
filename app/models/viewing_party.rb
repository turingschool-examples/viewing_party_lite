class ViewingParty < ApplicationRecord
  validates :duration, presence: true, numericality: :true
  validates :eventdate, presence: true
  # validate_date :eventdate
  validates :starttime, presence: true
  # validate_time :starttime

  has_many :user_viewing_parties
  has_many :users, through: :user_viewing_parties
end
