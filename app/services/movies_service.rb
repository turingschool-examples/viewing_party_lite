class MovieService

  def get_url(url)
    conn = Faraday.new(url: "https://api.themoviedb.org/3/") do |faraday|
      faraday.params(:api_key) = ENV['movie_api_key']
    end
  end

  def top_rated
    get_url('movie/top_rated')[:results]
  end

  def self.search_for_movie(movie)
    get_url('search/movie', movie)[:results]
  end
end
