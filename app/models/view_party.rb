class ViewParty < ApplicationRecord
  belongs_to :user
  has_many :party_guests

  validates :date, presence: true
  validates :time, presence: true
  validates :duration, presence: true, numericality: true
end