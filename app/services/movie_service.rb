class MovieService
  class << self

    def connection
      Faraday.new(url: 'https://api.themoviedb.org/3/') do |faraday|
        faraday.params['api_key'] = ENV['movie_api_key']
      end
    end

    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def top_rated_movies
      response = connection.get("movie/top_rated")
      parse_json(response)
    end

    def cast_members(movie_id)
      response = connection.get("movie/#{movie_id}/credits")
      parse_json(response)
    end

    def movie_details(movie_id)
      response = connection.get("movie/#{movie_id}")
      parse_json(response)
    end

    def reviews(movie_id)
      response = connection.get("movie/#{movie_id}/reviews")
      parse_json(response)
    end
  end
end
