class MovieService
  class << self








    def movie_deets(movie_id)
      response = conn.get("/3/movie/#{movie_id}?api_key=#{ENV['tmdb_key']}&language=en-US")
      parse_data(response)
    end

    def cast(movie_id)
      response = conn.get("/3/movie/#{movie_id}/credits?api_key=#{ENV['tmdb_key']}&language=en-US")
      parse_data(response)
    end

    def reviews(movie_id)
      response = conn.get("/3/movie/#{movie_id}/reviews?api_key=#{ENV['tmdb_key']}&language=en-US")
      parse_data(response)
    end
    private

    def conn
        Faraday.new(url: "https://api.themoviedb.org") do |faraday|
        faraday.params["x-api-key"] = ENV['api_key']
        end
    end

    def parse_data(response)
        data = JSON.parse(response.body, symbolize_names: true)
    end
  end
end
