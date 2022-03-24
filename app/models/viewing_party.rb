# frozen_string_literal: true

class ViewingParty < ApplicationRecord
  belongs_to :user
  has_many :user_viewing_parties
  has_many :users, through: :user_viewing_parties
  validates_presence_of :movie_id
  validates_presence_of :date_time
  validates_presence_of :duration
  validates_numericality_of :duration, greater_than_or_equal_to: :assign_duration, on: :create

  after_validation :assign_duration

  private

  def assign_duration
    self.duration = MovieFacade.new(movie_id).movie.minutes
  end

end
