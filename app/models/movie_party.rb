class MovieParty < ApplicationRecord
    validates_presence_of :movie_title,
                          :duration,
                          :start_time,
                          :movie_id

    has_many :user_movie_parties
    has_many :users, through: :user_movie_parties
end