class MovieService
  def self.popular_movies

    conn = Faraday.new("https://api.themoviedb.org")
    response = conn.get("3/movie/popular?api_key=#{ENV['movie_api_key']}&language=en-US&page=1")

    JSON.parse(response.body, symbolize_names: true)

  end

  def self.get_movie_details_db(movie_id)
    conn = Faraday.new("https://api.themoviedb.org")
    response = conn.get("/3/movie/#{movie_id}") do |f|
      f.params['api_key'] = ENV['movie_api_key']
      f.params['language'] = 'en-US'
    end

    json = JSON.parse(response.body, symbolize_names: true)
  end
end
