class MovieService

  def self.conn
    Faraday.new(url: 'https://api.themoviedb.org/3/') do |faraday|
      faraday.params['api_key'] = ENV['movie_api_key']
      faraday.adapter Faraday.default_adapter
    end
  end

  def self.top_rated
    response = conn.get('movie/top_rated')
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.movies_by_keyword(keyword)
    response = conn.get("search/movie?['api_key']query=#{keyword}")
    json = JSON.parse(response.body, symbolize_names: true)
    # require 'pry'; binding.pry 
  end
end