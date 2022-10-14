class ViewingParty < ApplicationRecord
    belongs_to :host, class_name: 'User'
    has_many :viewing_party_invitees
    has_many :users, through: :viewing_party_invitees
    validates_presence_of :duration, :date, :start_time, :movie_id, :host_id
    validates :duration, numericality: { only_integer: true } 
    validate :duration_longer_than_runtime

    def movie
        MoviesFacade.get_movie(movie_id)
    end

    private

    def duration_longer_than_runtime
        if movie.runtime > duration
            errors.add(:duration, "must be greater than movie runtime")
        end
    end
end