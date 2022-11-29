class UserMovieParty < ApplicationRecord
    validates_presence_of :status

    belongs_to :user
    belongs_to :movie_party
end