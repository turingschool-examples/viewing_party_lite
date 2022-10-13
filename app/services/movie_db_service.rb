class MovieDbService
    def self.connection
        conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
            faraday.params["api_key"] = ENV['themoviedb_key']
        end
    end

    def self.top_rated_movies
        response = self.connection.get("3/movie/top_rated")
        data = JSON.parse(response.body, symbolize_names: true)
    end

    def self.movies_search(keyword)
        conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
            faraday.params["api_key"] = ENV['themoviedb_key']
            faraday.params["query"] = keyword
        end
        response = conn.get("3/search/movie")
        data = JSON.parse(response.body, symbolize_names: true)
    end

    def self.find_movie_by_id(id)
        response = self.connection.get("3/movie/#{id}")
        data = JSON.parse(response.body, symbolize_names: true)
    end

    def self.find_movie_reviews(id)
        response = self.connection.get("3/movie/#{id}/reviews")
        data = JSON.parse(response.body, symbolize_names: true)
    end

    def self.cast(movie_id)
        response = self.connection.get("3/movie/#{id}/credits")
        data = JSON.parse(response.body, symbolize_names: true)
    end
end
