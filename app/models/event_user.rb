class EventUser < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  enum role: [:host, :attendee]
end
