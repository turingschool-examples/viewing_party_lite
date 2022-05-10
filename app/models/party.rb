class Party < ApplicationRecord

  validates_presence_of :duration, :when, :start_time

  belongs_to :user 
  has_many :attendees
  has_many :users, through: :attendees
end 