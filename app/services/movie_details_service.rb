class MovieDetailsService
  class << self

    def connection
      Faraday.new(url: "https://api.themoviedb.org/3/") do |faraday|
        faraday.params['api_key'] = ENV['movie_api_key']
      end
    end

    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def movie_details(movie_id)
      response = connection.get("movie/#{movie_id}")
      parse_json(response)
    end
  end
end
