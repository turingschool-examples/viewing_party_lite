class MovieService 
  def self.details(movie_id) 
    get_url("/movie/#{movie_id}")
  end

  def self.top_rated 
    get_url("/movie/top_rated")
  end

  def self.search(search_term)
    query = search_term.gsub(' ', '%20')
    get_url('/search/movie', "&language=en-US&query=#{query}&page=1&include_adult=false")
  end

  def self.get_url(url, search = '')
    response = Faraday.get("https://api.themoviedb.org/3#{url}?api_key=#{ENV["TMDB_API_KEY"]}#{search}")
    parse = JSON.parse(response.body, symbolize_names: true)
  end
end