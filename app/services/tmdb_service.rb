class TmdbService
  def initialize
    # @conn = Faraday.new
    @conn = Faraday.new(url: 'https://api.themoviedb.org/3/') do |faraday|
      faraday.params['api_key'] = ENV['tmdb_api_key']
    end
  end

  def top20
    # get_url("/movie/top_rated?api_key=#{ENV['tmdb_api_key']}")[:results]
    get_url('movie/top_rated')[:results]
  end

  def search(keyword, page = 1)
    # get_url("/search/movie?api_key=#{ENV['tmdb_api_key']}&query=#{keyword}&page=#{page}")
    get_url("search/movie?&query=#{keyword}&page=#{page}")
  end

  def get_url(url)
    response = @conn.get(url.to_s)
    JSON.parse(response.body, symbolize_names: true)
  end
end
