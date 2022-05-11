class MovieService
  def top_rated
    get_url("/3/movie/top_rated?api_key=131d23d3e9d511ff6fce6fdc6799d9be")
  end

  def search(title)
    get_url("/3/search/movie?api_key=131d23d3e9d511ff6fce6fdc6799d9be&language=en-US&query=#{title}&page=1&include_adult=false")
  end

  def get_url(url)
    response = Faraday.new("https://api.themoviedb.org")
    response = response.get(url)
    JSON.parse(response.body, symbolize_names: :true)
  end
end