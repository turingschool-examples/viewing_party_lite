class ReviewService

  def self.get_review_info(movie_id)
    response = conn.get("/3/movie/#{movie_id}/reviews?api_key=#{ENV['movies_api_key']}&language=en-US&page=1")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: "https://api.themoviedb.org") 
  end
end