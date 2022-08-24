class MovieService 

    def self.conn 
        Faraday.new(url: "https://api.themoviedb.org") do |faraday|
            faraday.headers["api_key"] = ENV['tmdb_key']
        end
    end 

    def self.movie_data(movie_id)
        response1 = conn.get("/3/movie/#{movie_id}?api_key=#{ENV['tmdb_key']}&language=en-US&page=1")
        json = JSON.parse(response1.body, symbolize_names: true)
    end 

    def self.cast_data(movie_id) 
        cast_response = conn.get("/3/movie/#{movie_id}/credits?api_key=#{ENV['tmdb_key']}&language=en-US")
        json = JSON.parse(cast_response.body, symbolize_names: true)
    end 

    def self.review_data(movie_id) 
        review_response = conn.get("/3/movie/#{movie_id}/reviews?api_key=#{ENV['tmdb_key']}&language=en-US")
        json = JSON.parse(review_response.body, symbolize_names: true)
    end 

end 