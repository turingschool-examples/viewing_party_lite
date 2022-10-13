class MovieDbService
    def self.top_rated_movies_data
        response = self.connection.get("3/movie/top_rated")
        parse(response.body)
    end

    def self.movies_search_data(keyword)
        conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
            faraday.params["api_key"] = ENV['themoviedb_key']
            faraday.params["query"] = keyword
        end
        response = conn.get("3/search/movie")
        parse(response.body)
    end

    def self.find_movie_by_id_data(id)
        response = self.connection.get("3/movie/#{id}")
        parse(response.body)
    end

    def self.find_movie_reviews_data(id)
        response = self.connection.get("3/movie/#{id}/reviews")
        parse(response.body)
    end

    def self.cast_data(movie_id)
        response = self.connection.get("3/movie/#{movie_id}/credits")
        parse(response.body)
    end

    private
    def self.connection
        conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
            faraday.params["api_key"] = ENV['themoviedb_key']
        end
    end

    def self.parse(response)
        JSON.parse(response, symbolize_names: true)
    end
end
