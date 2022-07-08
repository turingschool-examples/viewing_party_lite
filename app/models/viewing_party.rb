# frozen_string_literal: true

class ViewingParty < ApplicationRecord
  has_many :user_viewing_parties
  has_many :users, through: :user_viewing_parties

  validates_presence_of :date, :movie_id, :duration, :start_time

  def movie
    MovieFacade.movie_details(movie_id)
  end

  def formatted_date
    date.to_date.strftime('%A, %B %d')
  end

  def formatted_time
    start_time.to_time.strftime('%l:%M %p')
  end
end
