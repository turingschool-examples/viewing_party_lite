require 'faraday'
require 'json'

class MovieService
  def self.get_movie_data(movie_id)
    response = conn.get("/3/movie/#{movie_id}?api_key=#{Figaro.env.tmdb_api_key}&append_to_response=images,credits,reviews")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_rated_movies_asc(page_number)
    response = conn.get("/3/movie/top_rated?api_key=#{Figaro.env.tmdb_api_key}&language=en-US&page=#{page_number}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.search(search_params, page)
    response = conn.get("/3/search/movie?api_key=#{Figaro.env.tmdb_api_key}&query=#{search_params}&page=#{page}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    conn = Faraday.new(url: 'https://api.themoviedb.org')
  end
end