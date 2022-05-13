class TmdbService

  def self.top20
    get_url("/movie/top_rated?")[:results]
  end

  def self.search(keyword, page = 1)
    get_url("/search/movie?&query=#{keyword}&page=#{page}")
  end

  def self.movie_details(movie_id)
    get_url("/movie/#{movie_id}?&language=en-US")
  end

  def self.movie_cast(movie_id)
    get_url("/movie/#{movie_id}/credits?&language=en-US")
  end

  def self.movie_review(movie_id)
    get_url("/movie/#{movie_id}/reviews?&language=en-US")
  end

  def self.get_url(url)
    # response = Faraday.get("https://api.themoviedb.org/3#{url}")
    response = Faraday.get("https://api.themoviedb.org/3#{url}") do |faraday|
      faraday.params['api_key'] = ENV['tmdb_api_key']
    end
    parsed = JSON.parse(response.body, symbolize_names: true)
  end

end
