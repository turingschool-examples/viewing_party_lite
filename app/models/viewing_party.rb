class ViewingParty < ApplicationRecord
  has_many :attendees
  has_many :users, through: :attendees
  validates_presence_of :movie, :date_time, :duration
end
