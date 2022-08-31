# frozen_string_literal: true

class Event < ApplicationRecord
  validates_presence_of :duration,
                        :day,
                        :start_time,
                        :movie_title

  has_many :user_events
  has_many :users, through: :user_events
end
