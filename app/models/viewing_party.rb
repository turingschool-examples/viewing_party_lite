# frozen_string_literal: true

class ViewingParty < ApplicationRecord
  has_many :viewing_party_users
  has_many :users, through: :viewing_party_users

  validates_presence_of :movie_id
  validates_numericality_of :movie_id, greater_than: 0
  validates_presence_of :duration
  validates_numericality_of :duration, greater_than: 0
  validates_presence_of :date
  validates_presence_of :start_time

  def viewing_party_movie
    MovieService.movie_by_id(movie_id)
  end

  def poster_path
    viewing_party_movie[:poster_path]
  end

  def full_poster_path
    "https://image.tmdb.org/t/p/original#{poster_path}"
  end
end
