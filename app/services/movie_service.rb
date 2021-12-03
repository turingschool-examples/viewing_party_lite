class MovieService
  class << self

    def popular_movies_call_page_1
      call_api("/3/movie/top_rated?api_key=05946dc2dc50df636962153f45926dbe&page=1")
    end

    def popular_movies_call_page_2
      call_api("/3/movie/top_rated?api_key=05946dc2dc50df636962153f45926dbe&page=2")
    end

    def movie_details_call(id)
      call_api("/3/movie/#{id}?language=en-US&api_key=05946dc2dc50df636962153f45926dbe")
    end

    def cast_call(id)
      call_api("/3/movie/#{id}/credits?&language=en-US&api_key=05946dc2dc50df636962153f45926dbe")
    end

    def reviews_call(id)
      call_api("/3/movie/#{id}/reviews?&language=en-US&api_key=05946dc2dc50df636962153f45926dbe")
    end

    private

    def call_api(path)
      response = connection.get(path)
      parsed_data(response)
    end

    def connection
      Faraday.new("https://api.themoviedb.org")
    end

    def parsed_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
