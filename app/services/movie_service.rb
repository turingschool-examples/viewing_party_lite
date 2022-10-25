class MovieService
  def self.conn
    Faraday.new(url: 'https://api.themoviedb.org/3/') do |faraday|
      faraday.params['api_key'] = ENV['movie_api_key']
    end
  end

  def self.top_forty
    response_1 = conn.get('movie/top_rated?&page=1')
    response_2 = conn.get('movie/top_rated?&page=2')
    combined_response(response_1, response_2)
  end

  def self.movie_search(keyword_string)
    response_1 = conn.get("search/movie?query=#{keyword_string}&page=1")
    response_2 = conn.get("search/movie?query=#{keyword_string}&page=2")
    combined_response(response_1, response_2)
  end

  def self.combined_response(response_1, response_2)
    page1 = JSON.parse(response_1.body, symbolize_names: true)[:results]
    page2 = JSON.parse(response_2.body, symbolize_names: true)[:results]
    page1 + page2
  end

  def self.movie_details(movie_id)
    response = conn.get("movie/#{movie_id}?&append_to_response=credits,reviews")
    JSON.parse(response.body, symbolize_names: true)
  end
end
