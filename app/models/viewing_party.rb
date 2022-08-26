class ViewingParty < ApplicationRecord 
    validate :party_duration_minutes_greater_movie_duration_minutes, on: :create

    validates_presence_of :start_time
    validates_presence_of :party_duration_minutes
    validates_presence_of :movie_title
    validates_presence_of :movie_duration_minutes

    has_many :viewing_party_users
    has_many :users, through: :viewing_party_users

    def host_name
        host = User.find(viewing_party_users.where(status: "hosting").first.user_id)

        "#{host.first_name} #{host.last_name}"
    end

    def get_movie_id
        movie_result = MovieReverseSearchResultFacade.service(self.movie_title)

        movie_result.id
    end

    def get_movie_poster
        movie_result = MovieReverseSearchResultFacade.service(self.movie_title)

        movie_result.poster_path
    end

    def party_duration_minutes_greater_movie_duration_minutes 
        if movie_duration_minutes == nil || party_duration_minutes == nil 
        elsif movie_duration_minutes > party_duration_minutes
            errors.add(:party_duration_minutes, "Party duration has to be longer than the movie duration")
        end
    end
end 