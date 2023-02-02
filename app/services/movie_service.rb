class MovieService

  def self.api_call
    Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params["api_key"] = ENV["movie_api_key"]
    end
  end

  def self.top_rated_movies_response
    response = api_call.get("3/movie/top_rated?language=en-US&limit=20")
    parse(response)
  end

  def self.search_results_response(search_params)
    response = api_call.get("/3/search/movie?query=#{search_params}")
    parse(response)
  end

  def self.find_movie_response(movie_id)
    response = api_call.get("3/movie/#{movie_id}")
    parse(response)
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end