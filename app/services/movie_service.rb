class MovieService 
  def self.details(movie_id) 
    get_url("/movie/#{movie_id}")
  end

  def self.top_rated 
    get_url("/movie/top_rated")
  end

  def self.get_url(url)  
    response = Faraday.get("https://api.themoviedb.org/3#{url}?api_key=#{ENV["TMDB_API_KEY"]}")
    parse = JSON.parse(response.body, symbolize_names: true)
  end
end