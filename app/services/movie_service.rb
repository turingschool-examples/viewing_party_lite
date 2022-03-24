class MovieService 
  def self.conn 
    Faraday.new(url: 'https://api.themoviedb.org/3/') do |faraday|
      faraday.params['api_key'] = ENV["movie_api_key"]
      faraday.adapter Faraday.default_adapter
    end
  end

  def self.top_rated 
    response = conn.get("movie/top_rated")
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.movie_search(query)
    response = conn.get("search/keyword?query=#{query}")
    json = JSON.parse(response.body, symbolize_names: true)
  end
end