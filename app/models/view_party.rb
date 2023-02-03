class ViewParty < ApplicationRecord
  belongs_to :user

  validates :date, presence: true
  validates :time, presence: true
  validates :duration, presence: true, numericality: true
end