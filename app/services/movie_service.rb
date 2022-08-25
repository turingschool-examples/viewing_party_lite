class MovieService
  def self.search(query)
    conn = Faraday.new(url: 'https://api.themoviedb.org/') do |faraday|
      faraday.params['api_key'] = ENV['movie_api_key']
    end
    response = conn.get("/3/search/movie?&query=#{query}")
    JSON.parse(response.body, symbolize_names: true)
  end
end
