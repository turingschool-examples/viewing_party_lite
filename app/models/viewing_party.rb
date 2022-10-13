class ViewingParty < ApplicationRecord
    belongs_to :host, class_name: 'User'
    has_many :viewing_party_invitees
    has_many :users, through: :viewing_party_invitees

    def movie
        MoviesFacade.get_movie(movie_id)
    end
end