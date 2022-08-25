class ViewingParty < ApplicationRecord 
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

end 