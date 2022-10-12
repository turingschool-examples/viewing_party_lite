class MovieService
  def self.conn
    conn = Faraday.new(url: 'https://api.themoviedb.org/3/') do |faraday|
      faraday.params['api_key'] = ENV['movie_api_key']
    end 
  end

  def self.top_forty
    response_1 = conn.get('movie/top_rated?&page=1')
    response_2 = conn.get('movie/top_rated?&page=2')

    json1 = JSON.parse(response_1.body, symbolize_names: true)[:results]
    json2 = JSON.parse(response_2.body, symbolize_names: true)[:results]

    json1 + json2
  end

  def self.movie_search(keyword_string)
    response_1 = conn.get("search/movie?query=#{keyword_string}&page=1")
    response_2 = conn.get("search/movie?query=#{keyword_string}&page=2")

    json1 = JSON.parse(response_1.body, symbolize_names: true)[:results]
    json2 = JSON.parse(response_2.body, symbolize_names: true)[:results]

    json1 + json2
  end
end