class MovieService
  def get_movies
    get_url("/3/movie/top_rated?api_key=131d23d3e9d511ff6fce6fdc6799d9be")
  end

  def get_url(url)
    response = Faraday.new("https://api.themoviedb.org")
    response = response.get(url)
    JSON.parse(response.body, symbolize_names: :true)
  end
end