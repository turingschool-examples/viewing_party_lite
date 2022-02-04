class ViewingParty < ApplicationRecord
  validates_presence_of :date, 
                        :start_time, 
                        :length, 
                        :movie_id, 
                        :host_id 
end
