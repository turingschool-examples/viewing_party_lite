class Event < ApplicationRecord
  validates_presence_of :duration,
                        :day,
                        :start_time

  has_many :user_events
  has_many :users, through: :user_events  
end
