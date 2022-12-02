# frozen_string_literal: true
class ViewingParty < ApplicationRecord
  has_many :user_viewing_parties
  has_many :users, through: :user_viewing_parties
    
  validates_presence_of :movie
  validates_presence_of :movie_title
  validates_presence_of :duration
  validates_presence_of :date
  validates_presence_of :start_time
  validates_presence_of :status
  validates_presence_of :attendees

  def initialize(data)
    @movie = data[:movie_id]
    @movie_title = data[:movie_title]
    @duration = data[:duration]
    @date = data[:date]
    @start_time = data[:date]
    @status = data[:status]
    @attendees = []
  end

  def run_time_to_minutes
    binding.pry
    @movie.run_time
  end


end
