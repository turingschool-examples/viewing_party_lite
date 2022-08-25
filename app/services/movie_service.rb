class MovieService
  def self.top_rated_movies
    response1 = conn.get("movie/top_rated?&page=1")
    response2 = conn.get("movie/top_rated?&page=2")
    combine_pages(response1, response2)
  end

  def self.movie_search(keyword_string)
    response1 = conn.get("search/movie?query=#{keyword_string}&page=1")
    response2 = conn.get("search/movie?query=#{keyword_string}&page=2")
    combine_pages(response1, response2)
  end

  def self.conn
    connection = Faraday.new(url: "https://api.themoviedb.org/3/") do |faraday|
      faraday.params['api_key'] = ENV['movie_api_key']
    end
  end

  def self.combine_pages(response1, response2)
    page1 = JSON.parse(response1.body, symbolize_names: true)[:results]
    page2 = JSON.parse(response2.body, symbolize_names: true)[:results]
    output = page1 + page2
  end

  def self.movie_details(movie_id)
    response = conn.get("movie/#{movie_id}?&append_to_response=credits,reviews")
    JSON.parse(response.body, symbolize_names: true)
  end
end