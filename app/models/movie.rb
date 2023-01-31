class Movie < ApplicationRecord
  has_many :viewing_parties
  has_many :reviews
  has_many :movie_actors 
  has_many :actors, through: :movie_actors
end
