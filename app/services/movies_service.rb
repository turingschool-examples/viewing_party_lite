class MoviesService
    def self.conn
        Faraday.new(url: "https://api.themoviedb.org/", params: { api_key: ENV['movie_db_key'] } )
    end

    def self.movie_details(movie_id)
        response = conn.get("/3/movie/#{movie_id}")
        JSON.parse(response.body, symbolize_names: true)
    end

    def self.movie_images(movie_id)
        response = conn.get("/3/movie/#{movie_id}/images")
        JSON.parse(response.body, symbolize_names: true)
    end

    def self.top_20
        response = conn.get("/3/movie/top_rated")
        JSON.parse(response.body, symbolize_names: true) 
    end

    def self.search_results(search_query)
        response = conn.get("/3/search/movie", {query: search_query})
        JSON.parse(response.body, symbolize_names: true) 
    end

    def self.movie_credits(movie_id)
        response = conn.get("/3/movie/#{movie_id}/credits")
        JSON.parse(response.body, symbolize_names: true)
    end
    
    def self.movie_reviews(movie_id)
        response = conn.get("/3/movie/#{movie_id}/reviews")
        JSON.parse(response.body, symbolize_names: true)        
    end
end