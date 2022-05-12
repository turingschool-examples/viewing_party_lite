class MovieService < BaseService
  def self.top_rated_movies
    response = conn("https://api.themoviedb.org").get("/3/movie/top_rated?api_key=#{ENV['movie_api_key']}&language=en-US&page=1")

    get_json(response)
  end

  def self.search(keywords)
    response = conn("https://api.themoviedb.org").get("/3/search/movie?api_key=#{ENV['movie_api_key']}&language=en-US&query=#{keywords}&page=1&include_adult=false")

    get_json(response)
  end
end
