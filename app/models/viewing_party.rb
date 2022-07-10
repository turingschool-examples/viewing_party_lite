class ViewingParty < ApplicationRecord
  belongs_to :user, :foreign_key => 'host_id'
  has_many :attendees
  has_many :users, through: :attendees

  validates_presence_of :movie, :movie_id, :date, :start_time, :duration
end
