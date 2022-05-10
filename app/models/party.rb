class Party < ApplicationRecord

  validates_presence_of :duration, :when, :start_time

end 