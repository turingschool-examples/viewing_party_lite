class MovieService

  def top_rated
    conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.headers["X-API-KEY"] = ENV['movie_api_key']
    end

    response = conn.get("3/movie/top_rated?api_key=movie_api_key")

    json = JSON.parse(response.body, symbolize_names: true)
  end



  def search_movie
  end


end
