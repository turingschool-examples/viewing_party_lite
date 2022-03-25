class MovieService
  def self.find_top_movies
    url = "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['api_key']}&language=en-US&page=1"
    response = Faraday.get(url)
    data = JSON.parse(response.body, symbolize_names: true)
  end

  def self.search_movies(keyword)
    url = "https://api.themoviedb.org/3/search/movie?api_key=#{ENV['api_key']}&query=#{keyword}"
    response = Faraday.get(url)
    data = JSON.parse(response.body, symbolize_names: true)
  end
end
