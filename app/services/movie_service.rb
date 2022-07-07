class MovieService

  def self.top_20_movies
    response = connection.get("/movie/top_rated?api_key=bb30ad1261cb6dcc10ce904b995fbf9a")
    # results = (parse_response(movies))[:results]
    data = JSON.parse(response.body, symbolize_names: true)
    data[:results]
  end

  def connection
    Farady.new(url: "https://api.themoviedb.org/3")
  end

end
