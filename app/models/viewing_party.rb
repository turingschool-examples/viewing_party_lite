class ViewingParty < ApplicationRecord 
    validates_presence_of   :duration,
                            :date,
                            :host_id,
                            :movie_id

    has_many :user_viewing_parties
    has_many :users, through: :user_viewing_parties
end