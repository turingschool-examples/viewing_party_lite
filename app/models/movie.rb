class Movie < ApplicationRecord
  has_many :actor_movies
  has_many :actors, through: :actor_movies
  has_many :reviews
  has_many :viewing_parties

  validates_presence_of :title, :summary
  validates_numericality_of :runtime, :vote_average
end
