class MovieCast < ApplicationRecord
  belongs_to :cast_member
  belongs_to :movie
end
