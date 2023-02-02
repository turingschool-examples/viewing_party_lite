class MovieService
  def self.discover_movie(movie_query)
    conn = Faraday.new(url: "https://api.themoviedb.org", params: {api_key: ENV['api_key']})
    if movie_query == 'top rated'
      response = conn.get("/3/movie/top_rated")
    else
      response = conn.get("/3/search/movie", { query: movie_query, include_adult: false } )
    end
    data = JSON.parse(response.body, symbolize_names: true)
    @movies = data[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end
end