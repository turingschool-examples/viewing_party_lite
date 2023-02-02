class TMDBService
  def self.conn
    Faraday.new(url: "https://api.themoviedb.org")
  end

#could add something like
# def get_call(URI)
#   response = conn.get(URI, {"api_key" => ENV['tmdb_api_key']})
# end


  def self.top_rated_movies
    response = conn.get("/3/movie/top_rated", {"api_key" => ENV['tmdb_api_key']})
    data = JSON.parse(response.body, symbolize_names: true)
    
    TopRatedMoviesFacade.top_20_rated_movies(data)
  end

  def movie_search(keyword)
    response = conn.get("/3/search/movie", {"api_key" => ENV['tmdb_api_key'], "include_adult" => false, "query" => keyword})
    data = JSON.parse(response.body, symbolize_names: true)
    results = data[:results]
    data[0..19].map do |movie|
      MovieResults.new(movie)
    end
  end

  def movie_by_id(id)
    response = conn.get("/3/movie/#{id}", {"api_key" => ENV['tmdb_api_key']})
    movie = JSON.parse(response.body, symbolize_names: true)
    MovieResults.new(movie)
  end
end