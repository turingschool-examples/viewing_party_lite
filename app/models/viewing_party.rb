class ViewingParty < ApplicationRecord
  validates_presence_of :host, :duration, :movie_id, :image_path, :movie_title, :start_time
  validates_numericality_of :duration
  validates_numericality_of :movie_id
end
