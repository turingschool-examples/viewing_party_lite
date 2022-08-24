class MovieService

  def self.conn
    Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.params['api_key'] = ENV['movie_api_key']
    end
  end

  def self.top_rated
    response = conn.get('/3/movie/top_rated')
    json = JSON.parse(response.body, symbolize_names: true)
  end

<<<<<<< HEAD
  def self.movies_by_keyword(keyword)
    response = conn.get("search/movie?['api_key']query=#{keyword}")
    json = JSON.parse(response.body, symbolize_names: true)
    # require 'pry'; binding.pry 
  end
=======
  # def self.movies_by_keyword(keyword)
  #   response = conn.get("search/movie?query=#{keyword}")
  #   json = JSON.parse(response.body, symbolize_names: true)
  # end
>>>>>>> 37f039b (test/Click button to go to discover top rated results page)
end