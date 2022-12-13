# frozen_string_literal: true

class UserMovieParty < ApplicationRecord
  enum status: { hosting: 0, invited: 1 }

  validates_presence_of :status
  belongs_to :user
  belongs_to :movie_party
end
