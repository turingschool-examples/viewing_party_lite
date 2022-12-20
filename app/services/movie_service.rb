class MovieService
  class << self
    def call_for_a_movie(movie, page)
      response = connection.get("/3/search/movie?query=#{movie}&page=#{page}")
      parse_data(response)
    end

    def call_top_movies(page)
      response = connection.get("/3/movie/top_rated?page=#{page}")
      parse_data(response)
    end

    def call_movie_details(movie)
      response = connection.get("/3/movie/#{movie}?&append_to_response=casts,reviews")
      parse_data(response)
    end

    def call_movie_cast(movie)
      response = connection.get("/3/movie/#{movie}/credits")
      parse_data(response)
    end

    def call_movie_reviews(movie)
      response = connection.get("/3/movie/#{movie}/reviews")
      parse_data(response)
    end

  private
    def connection
      Faraday.new(url: "https://api.themoviedb.org") do |faraday|
        faraday.params["api_key"] = ENV['movie_api_key']
      end
    end

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
