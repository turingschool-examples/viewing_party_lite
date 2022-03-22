class ReviewService
    def self.conn
        Faraday.new(url: "https://api.themoviedb.org/3?api_key=#{ENV["movie_api_key"]}")
    end

    def self.reviews(movie_id)
        response = conn.get("movie/#{movie_id}/reviews")
        json = JSON.parse(response.body, symbolize_names: true)
    end
end