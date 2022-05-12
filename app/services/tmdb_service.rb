class TmdbService
  def initialize
    @conn = Faraday.new
  end

  def top20
    get_url("/movie/top_rated?api_key=#{ENV['tmdb_api_key']}")[:results]
  end

  def search(keyword, page=1)
    get_url("/search/movie?api_key=#{ENV['tmdb_api_key']}&query=#{keyword}&page=#{page}")
  end

  def movie_details(movie_id)
     get_url("/movie/#{movie_id}?api_key=#{ENV['tmdb_api_key']}&language=en-US")
  end

  def get_url(url)
    response = @conn.get("https://api.themoviedb.org/3#{url}")
    JSON.parse(response.body, symbolize_names: true)
  end
end
