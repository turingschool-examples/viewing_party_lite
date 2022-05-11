class Party < ApplicationRecord
  validates_presence_of :duration
  validates_presence_of :date
  validates_presence_of :start_time
  validates_presence_of :name
  validates_presence_of :host_id
end
