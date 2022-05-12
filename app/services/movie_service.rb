class MovieService
  def self.get_top_rated
    response = conn.get('/3/movie/top_rated?')
    get_json(response)
  end

  def self.movie_details(id)
    response = conn.get("/3/movie/#{id}?&append_to_response=credits,reviews")
    get_json(response)
  end

  def self.conn
    Faraday.new("http://api.themoviedb.org") do |faraday|
      faraday.params['api_key'] = ENV['movie_api_key']
    end
  end

  def self.get_json(response)
   JSON.parse(response.body, symbolize_names: true)
  end
end
