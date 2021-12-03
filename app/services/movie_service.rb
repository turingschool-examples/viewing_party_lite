class MovieService
  class << self

    def movie_details_call(id)
      call_api("/3/movie/#{id}?language=en-US&api_key=05946dc2dc50df636962153f45926dbe")
    end

    def cast_call(id)
      call_api("/3/movie/#{id}/credits?&language=en-US&api_key=05946dc2dc50df636962153f45926dbe")
    end

    def reviews_call(id)
      call_api("/3/movie/#{id}/reviews?&language=en-US&api_key=05946dc2dc50df636962153f45926dbe")
    end

    def call_api(path)
      response = connection.get(path)
      parsed_data(response)
    end

    # private
    def connection
      Faraday.new("https://api.themoviedb.org")
    end

    def parsed_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
