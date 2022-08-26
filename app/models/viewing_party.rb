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

    def movie_api_id
        conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
            faraday.headers["api_key"] = ENV['tmdb_key']
        end

        response = conn.get("/3/search/movie?api_key=#{ENV['tmdb_key']}&language=en-US&query=#{self.movie_title}&page=1&include_adult=false")

        json = JSON.parse(response.body, symbolize_names: true)
        
        matched_movie = json[:results].select {|movie| self.movie_title == movie[:title]}
        
        result = []
        result << matched_movie[0][:id] && result << matched_movie[0][:poster_path]
    end

end 