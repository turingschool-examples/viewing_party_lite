class TopCastService
  def self.get_cast(id)
    JSON.parse(conn(id).get.body, symbolize_names: true)
  end

  private
  
  def self.conn(id)
    Faraday.new(
                url: "https://api.themoviedb.org/3/movie/#{id}/credits",
                params: { api_key: ENV['MOVIE_DB_KEY'] }
                )
  end
end