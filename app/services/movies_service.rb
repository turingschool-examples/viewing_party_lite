class MoviesService

  def self.top_rated_movies
    conn = Faraday.new(url: 'https://api.themoviedb.org/3/movie/top_rated') do |faraday|
      faraday.params["api_key"] = ENV['api_key']
    end

    response = conn.get
    data = JSON.parse(response.body, symbolize_names: true)
  end

  def self.movie_details

  end

  def self.movie_credits

  end

  def self.movie_reviews

  end

end
