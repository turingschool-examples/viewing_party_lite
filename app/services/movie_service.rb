class MovieService

  def get_url(url, param = nil)
    conn = Faraday.new(url: "https://api.themoviedb.org/3/") do |faraday|
      faraday.params[:api_key] = ENV['movie_api_key']
      
      faraday.params[:query] = param unless param == nil
    end

    response = conn.get(url)

    data = JSON.parse(response.body, symbolize_names: true)
  end

  def top_rated
    get_url('movie/top_rated')[:results]
  end

  def search_for_movie(movie)
    get_url('search/movie', movie)[:results]
  end
end