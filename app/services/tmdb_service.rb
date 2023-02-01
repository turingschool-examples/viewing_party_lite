class TMDBService
  def conn
    Faraday.new(url: "https://api.themoviedb.org")
  end

  def get_top_rated_movies
    response = conn.get("/3/movie/top_rated", {"api_key" => ENV['tmdb_api_key']})
    data = JSON.parse(response.body, symbolize_names: true)
    results = data[:results]
    top_20 = results[0..19].map do |result|
      TopRatedMovies.new(result)
    end
  end

  def movie_search(keyword)
    response = conn.get("/3/search/movie", {"api_key" => ENV['tmdb_api_key'], "include_adult" => false, "query" => keyword})
    data = JSON.parse(response.body, symbolize_names: true)[:results]
    data[0..19].map do |movie|
      MovieResults.new(movie)
    end
  end
end