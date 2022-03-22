class MovieFacade
  def self.top_rated 
    conn = Faraday.new(url: 'https://api.themoviedb.org/3/') do |faraday|
      faraday.params['api_key'] = ENV["movie_api_key"]
      faraday.adapter Faraday.default_adapter
    end
    
    response = conn.get("movie/top_rated")
    json = JSON.parse(response.body, symbolize_names: true)
    @top_rated = json[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end
end