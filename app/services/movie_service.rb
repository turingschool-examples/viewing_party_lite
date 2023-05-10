class MovieService
  def self.top_rated_movies
    response1 = conn.get('/3/movie/top_rated?&page=1')
    response2 = conn.get('/3/movie/top_rated?&page=2')
    combine_pages(response1, response2)
  end

  def self.movie_search(keyword_string)
    response1 = conn.get("/3/search/movie?query=#{keyword_string}&page=1")
    response2 = conn.get("/3/search/movie?query=#{keyword_string}&page=2")
    combine_pages(response1, response2)
  end

  def self.movie_details(movie_id)
    response = conn.get("/3/movie/#{movie_id}?&append_to_response=credits,reviews")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    connection = Faraday.new(
      url: 'https://api.themoviedb.org',
      params: { api_key: ENV['movie_api_key'] }
    )
  end

  def self.combine_pages(*responses)
    output = []
    responses.each do |response|
      output << JSON.parse(response.body, symbolize_names: true)[:results]
    end
    output.flatten
  end
end
