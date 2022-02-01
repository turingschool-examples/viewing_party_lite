class Movie < ApplicationRecord
  has_many :reviews
  has_many :movie_casts
  has_many :cast_members, through: :movie_casts
  has_many :view_parties
end
