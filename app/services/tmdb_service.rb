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
end