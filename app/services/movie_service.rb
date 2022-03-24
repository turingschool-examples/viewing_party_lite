class MovieService
  def sel.get_url(url)
    Faraday.new(url)
  end

  def self.conn
    get_url(url: 'https://api.themoviedb.org')
  end

  def self.get_top_movie
    response = conn.get('3/movie/top_rated?api_key')
    parsed = JSON.parse(response.body, symbolized_names: true)
  end
end
