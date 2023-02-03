class TMDBService
  def self.conn
    conn = Faraday.new(url: "https://api.themoviedb.org")
  end


  def self.get_top_rated_movies
    response = conn.get("/3/movie/top_rated", {"api_key" => ENV['tmdb_api_key']})
    data = json_parse(response)
  end

  def self.get_movie_search_query(keyword)
    response = conn.get("/3/search/movie", {"api_key" => ENV['tmdb_api_key'], "include_adult" => false, "query" => keyword})
    data = json_parse(response)
  end

  def self.get_movie_by_id(id)
    response = conn.get("/3/movie/#{id}", {"api_key" => ENV['tmdb_api_key']})
    movie = json_parse(response)
    MovieResults.new(movie)
  end

  def self.json_parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_movie_cast(movie_id)
    response = conn.get("/3/movie/#{movie_id}/credits", {"api_key" => ENV['tmdb_api_key']})
    data = json_parse(response)
  end

  def self.get_movie_reviews(movie_id)
    response = conn.get("/3/movie/#{movie_id}/reviews", {"api_key" => ENV['tmdb_api_key']})
    data = json_parse(response)
  end
end