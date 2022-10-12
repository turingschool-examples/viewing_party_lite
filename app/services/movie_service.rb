class MovieService
  def self.movie_by_id(search_id)
    response = conn.get("movie/#{search_id}")
    data = JSON.parse(response.body, symbolize_names: true)
  end

  private
  def self.conn
    Faraday.new('https://api.themoviedb.org/3/') do |faraday|
      faraday.params["api_key"] = ENV['movie_key']
    end
  end
end