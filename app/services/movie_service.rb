require 'faraday'
require 'json'

class MovieService
  def top_movies
    response_1 = conn.get("/3/movie/top_rated?&language=en-US&page=1")
    response_2 = conn.get("/3/movie/top_rated?&language=en-US&page=2")
    body_1 = parse_json(response_1)
    body_2 = parse_json(response_2)
    put_returns_together(body_1[:results], body_2[:results])
    #returns an API response that includes the top 20 rated movies in the database.
    #turns the JSON into a hash both times
    #concats results together 
  end

  def search_movies(search_param)
    response = conn.get("/3/search/movie?&language=en-US&page=1&query=#{search_param}")
    # Takes the argument provided by the form and uses it as the query keyword param when sending request.
    body = parse_json(response)
  end

  def find_movie(id)
    response = conn.get("/3/movie/#{id}?")
    body = parse_json(response)
  end


  private

    def conn
      Faraday.new(url: "https://api.themoviedb.org") do |faraday|
        faraday.params['api_key'] = ENV['tmdb_api_key']
      end
    end

    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def put_returns_together(first, second)
      first + second
    end
end
