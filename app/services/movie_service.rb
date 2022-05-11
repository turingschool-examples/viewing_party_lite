require 'faraday'
require 'json'

class MovieService
  def top_movies
    response = conn.get("/3/movie/top_rated?&language=en-US&page=1")
    #returns an API response that includes the top 20 rated movies in the database.
    body = parse_json(response)
    #turns the JSON into a hash
  end

  def search_movies(search_param)
    response = conn.get("/3/search/movie?&language=en-US&page=1&query=#{search_param}")
    # Takes the argument provided by the form and uses it as the query param when sending request.
    body = parse_json(response)
  end

  def find_movie(id)

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
end
