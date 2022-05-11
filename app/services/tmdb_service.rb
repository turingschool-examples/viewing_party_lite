class TmdbService
  def initialize
  	@conn = Faraday.new 
  end

  def get_top20
  	get_url('top_rated')[:results]
  end

  def get_url(url)
  	response = @conn.get("https://api.themoviedb.org/3/movie/#{url}?api_key=#{ENV['tmdb_api_key']}")
  	JSON.parse(response.body, symbolize_names: true)
  end
end