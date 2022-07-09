class MoviesService
  def self.get_url(url, keyword = nil)
    conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.params[:api_key] = ENV['movie_api_key']
      faraday.params[:query] = keyword unless keyword.nil?
    end

    response = conn.get(url)

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_top_rated
    get_url('3/movie/top_rated')[:results]
  end

  def self.find_movies(keyword)
    get_url('3/search/movie', keyword)[:results]
  end

  def self.get_movie(movie_id)
    get_url("3/movie/#{movie_id}")
  end

  def self.get_movie_reviews(movie_id)
    get_url("3/movie/#{movie_id}/reviews")[:results]
  end

  def self.get_movie_cast(movie_id)
    get_url("3/movie/#{movie_id}/credits")[:cast]
  end
end
