class ViewingParty < ApplicationRecord
  belongs_to :user
  validates_presence_of :duration
  validates_presence_of :date
  validates_presence_of :time
  validates_presence_of :movie_id
end
