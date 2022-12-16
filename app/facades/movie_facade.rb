class MovieFacade
  def self.movie_search(params)
    conn = Faraday.new(url: 'https://api.themoviedb.org/3/') do |faraday|
      faraday.params["api_key"] = ENV["movie_api_key"]
    end

    response = conn.get("search/movie?query=#{params}")
    json = JSON.parse(response.body, symbolize_names: true)
    @movies = json[:results][0..19].map do |movie_data|
      Movie.new(movie_data)
    end
  end

  def self.top_rated
    conn = Faraday.new(url: 'https://api.themoviedb.org/3/') do |faraday|
      faraday.params["api_key"] = ENV["movie_api_key"]
    end

    response = conn.get("movie/top_rated")
    json = JSON.parse(response.body, symbolize_names: true)
    @movies = json[:results][0..19].map do |movie_data|
      Movie.new(movie_data)
    end
  end
end