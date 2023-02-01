class MoviesController < ApplicationController
  def index
    conn = Faraday.get('https://api.themoviedb.org/3/movie/top_rated?api_key=d15da2c6fe48d15a51f43f47b05c0ed1&language=en-US&page=1')
    data = JSON.parse(conn.body, symbolize_names: true)
    @movies = data[:results]
  end
end