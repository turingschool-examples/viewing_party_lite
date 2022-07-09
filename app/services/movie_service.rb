class MovieService < BaseService
  def self.get_top_rated
    response = conn.get("/3/movie/top_rated?api_key=#{ENV['api_key']}")
    data = get_json(response)
    data[:results]
  end
end
