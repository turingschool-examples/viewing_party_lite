# require 'faraday'
# require 'json'

class MovieService
  def self.connection
    Faraday.new(url: "https://api.themoviedb.org/3/") do |faraday|
      faraday.params['api_key'] = ENV['api_key']
    end
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.top_rated
    response = connection.get('movie/top_rated')
    parsed = parse_json(response)
    parsed[:results]
  end

  def self.search_for_movie(keyword)
    connection.get('/search/movie')[:results] do |faraday|
      faraday.params["query"] = keyword
    end
  end

  # def self.search_for_movie(movie)

  #   connection.get('search/movie', movie)[:results]
  # end

  def self.cast_members(movie_id)
    response = connection.get("movie/#{movie_id}/credits")
    parse_json(response)
  end
end
